function FirstLetterUpper(str)
{
    return str.charAt(0).toUpperCase() + str.slice(1);
}

function CargarImgCard(element, id){
    let imgs = Array.from(document.getElementsByClassName('card-img-top'));
    let url = "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/CircuitName_Circuit.png.transform/2col-retina/image.png";
    imgs.forEach(element => {
        element.setAttribute('src', url.replace('CircuitName', FirstLetterUpper(element.getAttribute('id'))));
    });

    //Seteados manualmente por discrepancias entre el nombre de la api de ergast y el nombre en la pagina de formula1
    $("#Azerbaijan").attr("src", "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Baku_Circuit.png.transform/2col-retina/image.png");
    $("#Monaco").attr("src", "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Monoco_Circuit.png.transform/2col-retina/image.png");
    $("#UAE").attr("src", "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Circuit%20maps%2016x9/Abu_Dhabi_Circuit.png.transform/2col-retina/image.png");
}

function ListarPilotos(){
      $.ajax({
        url: 'https://ergast.com/api/f1/circuits.json?limit=100',
        type: 'GET',
        timeout: 0,
        async: false,
        success:
            function(response)
            {
                console.log("me gusta el chinchulin");
                console.log(response);
            }
      })
}