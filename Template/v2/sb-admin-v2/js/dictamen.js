$(function(){
    console.log($('#tblDictamen').find('tbody tr'));
    $('#tblDictamen').find('tbody tr').remove();
    $('#tblDictamen').find('tbody td').remove();
    
    $('#tblDictamen').find('tbody').append('<tr></tr>');
    $('#tblDictamen').find('tbody').find('tr:last').append('<td>Perros</td>')
    $('#tblDictamen').find('tbody').find('tr:last').append('<td>Perros1</td>')
    $('#tblDictamen').find('tbody').find('tr:last').append('<td>Perros2</td>')
    $('#tblDictamen').find('tbody').find('tr:last').append('<td><input type="radio" value="1"/></td>').find('input').on('click',function(){
    console.log($(this).val());
    });
    
    
});
