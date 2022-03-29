require('./bootstrap');

import Alpine from 'alpinejs';

import $ from 'jquery';

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

window.Alpine = Alpine;

Alpine.start();

const formatter = new Intl.NumberFormat('en-US', {
    minimumFractionDigits: 2,      
    maximumFractionDigits: 2,
 });

//caisse calcul
$(function(){
    //filter only number
    filter('.event-form');
    calculate(false, '');

    $('.delete-operation').on('click',function (e) {
        e.preventDefault();
        let delete_action  = $(this);
        if (confirm("Voulez-vous vraiment supprimer cette opération?") == false) {
            return false;
        }
        let item_id = $(this).attr('item-id');
        axios
            .post('/dashboard/deleteoperation', {
                item_id: item_id
            })
            .then(function (response) {
                $("#op-"+item_id).hide('slow');
                $('.total-caisse').html(`${response.data.total} €`);
            })
    });

    $('.delete-typeoperation').on('click',function (e) {
        e.preventDefault();
        if (confirm("Voulez-vous vraiment supprimer ce type d'opération?") == false) {
            return false;
        }
        let typeoperation_id = $(this).attr('data-id');
        axios
            .post('/dashboard/deletetypeoperation', {
                typeoperation_id: typeoperation_id
            })
            .then(function (response) {
                $("#typeop-"+typeoperation_id).hide('slow');
            })
    });

    $(".add").on("click",function () {
        let type = $(this).attr("data-type");
        axios
            .post('/dashboard/addnewline', {
                type: type,
            })
            .then(function (response) {
                let data = response.data;     
                $('.inner-'+type).append(data.html);
                filter('.event-form-child');
                calculate(true,data.uniqid);
                $('#remove-'+ data.uniqid).on('click',function(){
                    $('#line-'+ data.uniqid).remove();
                    sub_total(type);
                    sum_total();
                });
            });
    });
})

function sum_total(){
   var sum = 0;
    $( '.subtotal-item' ).each( function( i , e ) {
        var v = parseFloat( $( e ).val() );
        if ( !isNaN( v ) )
            sum += v;
    });
    sum = formatter.format(sum);
    $('#total').html(sum+'€');
    $('input[name^="total"]').val(sum);
}

function sub_total(type){
    var sum = 0;
     $( '#'+type+' .subtotal-item' ).each( function( i , e ) {
         var v = parseFloat( $( e ).val() );
         if ( !isNaN( v ) )
             sum += v;
     });
     sum = formatter.format(sum);
     $('.subtotal-'+type).html(sum+'€');
 }

function calculate(is_line,uniqid){
    if (is_line){
        $("#line-"+uniqid).on( "input", function() {
            let quantity = parseInt($(this).find('input').val());
            quantity = (quantity ? quantity : 0);
            let nominal = parseInt($(this).find('select').val());
            let type = $(this).attr('data-type');
            
            let subtotal = 0;
            switch (type){
                case 'billets':
                    subtotal = quantity * nominal;
                break;
                case 'pieces':
                    subtotal = quantity * nominal;
                break;
                case 'centimes':
                    subtotal = (quantity * nominal)/100;
                break;    
            }       
            
            $(this).find('input[type=hidden][name^="'+type+'['+uniqid+']"]').val(subtotal);
            sub_total(type);
            sum_total();
        });
    }else{
        $( ".event-form" ).on( "input", function() {
            let quantity = parseInt($(this).find('input').val());
            quantity = (quantity ? quantity : 0);
            let nominal = parseInt($(this).find('select').val());
            let type = $(this).attr('data-type');
            let subtotal = 0;
            switch (type){
                case 'billets':
                    subtotal = quantity * nominal;
                break;
                case 'pieces':
                    subtotal = quantity * nominal;
                break;
                case 'centimes':
                    subtotal = (quantity * nominal)/100;
                break;    
            }       
            $(this).find('.subtotal-item').val(subtotal);
            sub_total(type);
            sum_total();
        });
    }
   
}

function filter(targetform){
    $(targetform+' input').keyup(function(e)                              {
        if (/\D/g.test(this.value))
        {
            this.value = this.value.replace(/\D/g, '');
        }
    });
}

