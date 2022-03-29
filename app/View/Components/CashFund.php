<?php

namespace App\View\Components;

use Illuminate\View\Component;

class CashFund extends Component
{
    public $title;
    public $operations;
    public $typeoperations;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($title,$operations,$typeoperations)
    {
        //
        $this->title = $title;
        $this->operations = $operations;
        $this->typeoperations = $typeoperations;
        
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.cash-fund');
    }
}
