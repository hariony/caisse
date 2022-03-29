<x-app-layout>
    <x-slot name="header">
        <h1 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Modification des opérations') }}
        </h1>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="container">
                    <form action="{{ route('dashboard.update') }}" method="POST">
                        {{ csrf_field() }}
                        <input type="hidden" name="operation_id" value="{{$operation_id}}">
                        <x-cash-fund title="Entrée de fond de caisse" :operations="$operations" :typeoperations="$typeoperations"></x-cash-fund>
                        <x-money-type title="Billets" :nominal="[5,10,20,50,100,200,500]" :type="'billets'" :datas="$datas">
                            <x-slot name='subtotal'>0€</x-slot>
                        </x-money-type>
                        <x-money-type title="Pièces" :nominal="[1,2]" :type="'pieces'" :datas="$datas">
                            <x-slot name='subtotal'>0€</x-slot>
                        </x-money-type>
                        <x-money-type title="Centimes" :nominal="[1,2,5,10,20,50]" :type="'centimes'" :datas="$datas">
                            <x-slot name='subtotal'>0€</x-slot>
                            <x-slot name='liner'><hr class="line-end mt-5"></x-slot>
                        </x-money-type>
                        <div class="center-box">
                            <button type="submit" class="btn btn-secondary btn-lg">Enregistrer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
