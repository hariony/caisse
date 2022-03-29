<div class="row mt-5 mb-3 pd-left event-form-child" id="line-{{ $uniqid }}" data-type="{{ $type }}">
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
        <div class="mb-2">
            <a id="remove-{{ $uniqid }}" class="mt-custom btn btn-outline-danger">Supprimer</a>
        </div>
    </div>
    <input type="hidden" class="subtotal-item" name="{{ $type }}[{{$uniqid}}][subtotal]" value="111">
</div>