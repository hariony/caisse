<x-app-layout>
    <x-slot name="header">
        <h1 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Caisse du jour') }}
        </h1>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="container">
                    <div class="row p-4">
                        <div class="col-12 col-sm-4 col-md-3">
                            <h2>Total caisse</h2>
                            <span class="total-caisse"> {{ $total }} €</span>
                        </div>
                        <div class="col-12 col-sm-8 col-md-9">
                            <h2>Opération du jour</h2>
                            <table class="table">
                                <thead>
                                  <tr>
                                    <th scope="col">Date</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Montant</th>
                                    <th scope="col">Retraits</th>
                                    <th scope="col">Ajouts</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Actions</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  @if(!empty($operations))
                                    @foreach($operations as $operation)
                                      <tr id="op-{{ $operation['id'] }}">
                                        <th scope="row">{{ \Carbon\Carbon::parse($operation->date)->format('d M Y') }}</th>
                                        <td>{{ $operation->typeoperation->titre }}</td>
                                        <td>{{ $operation->total }} €</td>
                                        <td>{{ $operation->retrait }} €</td>
                                        <td>{{ $operation->ajout }} €</td>
                                        <td>{{ $operation->total }} €</td>
                                        <td class="actions">
                                            <a href="/dashboard/edit/{{ $operation->id }}" class="btn btn-outline-warning">Editer</a>
                                            <a href="#" class="btn btn-outline-danger delete-operation"
                                              item-id="{{ $operation->id }}">Supprimer</a>
                                        </td>
                                      </tr>
                                    @endforeach
                                  @else
                                  <tr>
                                    <td colspan="7"> Aucune donnée n'est encore enregistré dans la base de données</td>
                                  </tr>  
                                  @endif  
                                </tbody>
                              </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
