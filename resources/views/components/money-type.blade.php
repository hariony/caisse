@php
$uniqid = uniqid()
@endphp
@if (empty($datas))
    <div class="p-6 bg-white rel" id="{{ $type }}">
        <h2>{{ $title }}</h2>
        <div class="event-form row mt-5 mb-3 pd-left" data-type="{{ $type }}">
            <div class="col-3">
                <div class="mb-2">
                    <label for="exampleFormControlInput1" class="form-label">Nominal</label>
                    <select class="form-select" name="{{ $type }}[{{$uniqid}}][nominal]" aria-label="Nominal">
                        @foreach($nominal as $i => $value)
                            <option value="{{ $value }}">{{ $value }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-3">
                <div class="mb-2">
                    <label for="exampleFormControlInput1" class="form-label">Quantité</label>
                    <input type="text" class="form-control" name="{{ $type }}[{{$uniqid}}][quantity]" value="0">
                </div>
            </div>
            <div class="col-6">
            </div>
            <input type="hidden" class="subtotal-item" name="{{ $type }}[{{$uniqid}}][subtotal]" value="0">
        </div>
        <span class="inner-{{ $type }}"></span>
        <button type="button" class="btn btn-success green mg-left add" data-type="{{ $type }}">Ajouter</button>
        <span class="right-amount subtotal-{{ $type }}">{{ $subtotal }}</span>
        {{ $liner = !empty($liner) ? $liner : ''  }}
    </div>
@else
@php
switch ($type) {
    case 'billets':
        $datas = $datas->billets;
        break;
    case 'pieces':
        $datas = $datas->pieces;
        break;
    case 'centimes':
        $datas = $datas->centimes;
        break;    
}
@endphp
    <div class="p-6 bg-white rel" id="{{ $type }}">
        <h2>{{ $title }}</h2>
        @php
            $subtotal = 0 ;
        @endphp
        @foreach($datas as $key=>$data)
            @php
            if ($type == 'billets' || $type == 'pieces'){
                $subtotal = $subtotal + ($data->nominal * $data->quantity) ;
            }else{
                $subtotal = $subtotal + (($data->nominal * $data->quantity)/100) ;
            }
            
            @endphp
            <div class="event-form row mt-5 mb-3 pd-left" data-type="{{ $type }}">
                <div class="col-3">
                    <div class="mb-2">
                        <label for="exampleFormControlInput1" class="form-label">Nominal</label>
                        <select class="form-select" name="{{ $type }}[{{$uniqid}}][nominal]" aria-label="Nominal">
                            @foreach($nominal as $i => $value)
                                <option value="{{ $value }}" @if($data->nominal == $value) selected @endif>{{ $value }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-2">
                        <label for="exampleFormControlInput1" class="form-label">Quantité</label>
                        <input type="text" class="form-control" name="{{ $type }}[{{$uniqid}}][quantity]" value="{{ $data->quantity}}">
                    </div>
                </div>
                <div class="col-6">
                </div>
                <input type="hidden" class="subtotal-item" name="{{ $type }}[{{$uniqid}}][subtotal]" value="{{ $data->subtotal}}">
            </div>
        @endforeach
        <span class="inner-{{ $type }}"></span>
        <button type="button" class="btn btn-success green mg-left add" data-type="{{ $type }}">Ajouter</button>
        
        <span class="right-amount subtotal-{{ $type }}">{{ $subtotal }} €</span>
        {{ $liner = !empty($liner) ? $liner : ''  }}
    </div>
@endif
