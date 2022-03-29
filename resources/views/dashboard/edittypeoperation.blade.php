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
                            <h2>Ajouter un nouveau type d'opération</h2>
                            <form method="post" action="{{ route('dashboard.typeoperation.edit',['typeoperation_id'=>$typeoperation['id']])}}">
                                @csrf
                                <input type="hidden" name="typeoperation_id" value="{{ $typeoperation['id'] }}">
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <label for="date" class="form-label">Entrez le nom de l'opération</label>
                                        <input type="text" class="form-control" name="titre" id="titre"value="{{ $typeoperation['titre'] }}">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-secondary btn-lg">Enregistrer</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>