<?php

namespace App\View\Components;

use Illuminate\View\Component;

class MoneyType extends Component
{
    public $title;
    public $nominal; 
    public $type;
    public $datas;
    
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($title,$nominal,$type,$datas)
    {
        $this->title = $title;
        $this->nominal = $nominal;
        $this->type = $type;
        $this->datas = $datas;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.money-type');
    }
}
