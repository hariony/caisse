<x-app-layout>
    <x-slot name="header">
        <h1 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __("Gestion des types d'opération") }}
        </h1>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 operation-view">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="container">
                    <div class="row p-4">
                        <div class="col">
                            <h2>Opération du jour</h2>
                            <a href="{{ route('dashboard.typeoperation.add')}}" class="btn btn-success add-operation-type">Ajouter un nouveau type d'opération</a>
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Type</th>
                                    <th  width="20%" scope="col">Date</th>
                                    <th width="25%" scope="col">Actions</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    @foreach($type_operations as $data)
                                        <tr id="typeop-{{ $data['id'] }}">
                                            <td>{{ $data['id'] }}</td>
                                            <td>{{ $data['titre'] }}</td>
                                            <td>{{ \Carbon\Carbon::parse($data['created_at'])->format('d M Y') }}</td>
                                            <td class="actions">
                                                <a href="{{ route('dashboard.typeoperation.edit',['typeoperation_id'=>$data['id']]) }}" class="btn btn-outline-warning">Editer</a>
                                                <a class="btn btn-outline-danger delete-typeoperation"
                                                   data-id="{{ $data['id'] }}">Supprimer</a>
                                            </td>
                                        </tr>
                                    @endforeach                          
                                </tbody>
                              </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
