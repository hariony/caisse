<div class="p-6 bg-white rel">
    <h2>{{ $title }}</h2>
    <div class="mb-4 mt-4 pd-left">
        <div class="mb-2 w-25">
            <label for="type_operation" class="form-label">Type d'opération</label>
            <select class="form-select" name="type_operation" id="type_operation" aria-label="Type d'opération">
                @foreach($typeoperations as $item)
                    <option value="{{ $item['id'] }}" {{ (!empty($operations) && $operations['typeoperation_id']== $item['id'] ) ? "selected" : "" }}>{{ $item['titre'] }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-2 w-25">
            <label for="date" class="form-label">Date</label>
            <input type="date" class="form-control" id="date" name="date" placeholder="{{ !empty($operations) ? \Carbon\Carbon::parse($operations['date'])->format('d/m/Y') : "" }}" value="{{ !empty($operations) ? \Carbon\Carbon::parse($operations['date'])->format('Y-m-d') : "" }}">
        </div>
        <div class="mb-2">
            <label for="note" class="form-label">Note</label>
            <textarea class="form-control" id="note" name="note" rows="3">{{ !empty($operations) ? $operations['note'] : "" }}</textarea>
        </div>
    </div>
    <input type="hidden" name="total" value="{{ !empty($operations) ? $operations['total'] : 0 }}">
    <span class="right-amount" id="total">{{ !empty($operations) ? $operations['total'] : 0 }} €</span>
</div>