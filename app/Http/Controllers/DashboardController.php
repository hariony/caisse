<?php

namespace App\Http\Controllers;

use App\Models\Operation;
use Illuminate\Http\Request;
use App\Models\TypeOperation;

class DashboardController extends Controller
{
    //

    public function index(){
        $operations = Operation::all()->toArray();
        $ajout = Operation::all()->sum('ajout');
        $retrait = Operation::all()->sum('retrait');
        $total = (($ajout - $retrait) > 0) ? $ajout - $retrait : 0;
        return view('dashboard.index',[
            'total' => $total,
            'operations' => $operations
        ]);
    }

    public function ajax_addnewline(Request $request)
    {
        $type = $request->type;
        switch ($type){
            case 'billets':
                $nominal = [5,10,20,50,100,200,500];
            break;
            case 'pieces':
                $nominal = [1,2];
            break;
            case 'centimes':
                $nominal = [1,2,5,10,20,50];
            break;
        }
        $uniqid = uniqid();
        $returnHTML = view('components.newline',['type'=> $type,'nominal'=>$nominal,'uniqid'=>$uniqid])->render();
        return response()->json(array('success' => true,'uniqid'=> $uniqid, 'html' => $returnHTML));
    }

    public function store(Request $request)
    {
        if ($request->isMethod('post')) {

            $datas = $request->post();

            $operation = new Operation();
            $operation->typeoperation_id = $datas['type_operation'];
            $operation->date = $datas['date'];
            $operation->note = $datas['note'];
            $operation->total = $datas['total'];
            $operation->ajout = ($datas['type_operation'] ==1 ) ? $datas['total'] : 0;
            $operation->retrait = ($datas['type_operation'] == 2 || $datas['type_operation'] == 3) ? $datas['total'] : 0;
            $operation->datas = json_encode(['billets' => $datas['billets'], 'pieces' => $datas['pieces'], 'centimes' => $datas['centimes']]);
            $operation->save();
            return redirect('/dashboard');
        }
    }

    public function update(Request $request)
    {
        if ($request->isMethod('post')) {

            $operation_id = $request->operation_id;

            $datas = $request->post();

            $operation = Operation::find($operation_id);
            $operation->typeoperation_id = $datas['type_operation'];
            $operation->date = $datas['date'];
            $operation->note = $datas['note'];
            $operation->total = $datas['total'];
            $operation->ajout = ($datas['type_operation'] ==1 ) ? $datas['total'] : 0;
            $operation->retrait = ($datas['type_operation'] == 2 || $datas['type_operation'] == 3) ? $datas['total'] : 0;
            $operation->datas = json_encode(['billets' => $datas['billets'], 'pieces' => $datas['pieces'], 'centimes' => $datas['centimes']]);
            $operation->save();
            return redirect('/dashboard');
        }
    }

    public function deleteoperation(Request $request)
    {
        $result = Operation::find($request->post('item_id'))->delete();
        if ($result) {
            $ajout = Operation::all()->sum('ajout');
            $retrait = Operation::all()->sum('retrait');
            $total = (($ajout - $retrait) > 0) ? $ajout - $retrait : 0;
            return response()->json([
                'total' => $total,
            ]);
        }
    }

    public function entry(Request $request){
        $typeoperations = TypeOperation::all()->toArray();
        return view('dashboard.entry',['typeoperations'=>$typeoperations]);
    }

    public function edit(Request $request){
        $operation_id = $request->operation_id;
        $operations = Operation::find($operation_id)->toArray();
        $datas = json_decode($operations['datas']);
        $typeoperations = TypeOperation::all()->toArray();
        return view('dashboard.edit',[
            'operations' => $operations,
            'datas' => $datas,
            'operation_id' => $operation_id,
            'typeoperations' => $typeoperations
        ]);
    }

    public function operationtype(Request $request){

        $typeOperations = TypeOperation::all()->toArray();
        return view('dashboard.operationtype', [
            'type_operations' => $typeOperations
        ]);
    }

    public function addtypeoperation(Request $request){
        if ($request->isMethod('post')) {
            $typeOperation = new TypeOperation();
            $typeOperation->titre = $request->post('titre');
            $typeOperation->save();
            return redirect(route('dashboard.operationtype'));
        }
        return view('dashboard.addtypeoperation');
    }

    public function edittypeoperation(Request $request, $typeoperation_id){
        $typeoperation = TypeOperation::find($typeoperation_id)->toArray();
        
        if ($request->isMethod('post')) {
            $typeoperation = TypeOperation::find($typeoperation_id);
            $typeoperation->titre = $request->post('titre');
            $typeoperation->save();
            return redirect(route('dashboard.operationtype'));
        }
        return view('dashboard.edittypeoperation',['typeoperation'=> $typeoperation]);
    }

    public function deletetypeoperation(Request $request){
        $result = TypeOperation::find($request->post('typeoperation_id'))->delete();
        if ($result) {
            return response()->json([
                'success' => true,
            ]);
        }
    }

}
