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

function CargarImgStock(element){
    element.setAttribute('src', "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg");
    element.style.height = "161px";
    element.style.width = "286px";
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
                console.log(response);
            }
      })
}

function HandlerSearchbar(input){
    document.querySelector("[data-result-container]").innerHTML = "";
    $("#resultContainer").removeClass('border');
    if(input.length < 3) return;

    let tracks;

    //Cacheo de los tracks desde el lado del cliente
    if(sessionStorage.getItem("tracks")) tracks = JSON.parse(sessionStorage.getItem("tracks"));
    else {
        $.ajax({
            type: 'POST',
            dataType: "JSON",
            url: '/Home/listarTracksxNombre',
            async: false,
            success:
              function (response) {
                console.log(response);
                sessionStorage.setItem("tracks", JSON.stringify(response));
                tracks = response;
              }
        })
    }

    $("#resultContainer").addClass('border');
    
    const resultTemplate = document.querySelector("[data-result-template]");

    tracks.forEach(element => {
        if(element.nombre.toLowerCase().includes(input.toLowerCase()) == true){
            const result = resultTemplate.content.cloneNode(true).children[0];
            const link = result.querySelector("[data-result-text]");
            link.textContent = element.nombre;
            link.setAttribute("href", "/Home/VerDetalleTrack?IdT=" + element.id);
            document.querySelector("[data-result-container]").append(result);
        }
    });
}

function CambiarAnnoTrack(IdT, anno)
{
    $.ajax({
        type: 'POST',
        url: '/Home/BuscarCarreraxAno',
        dataType: 'JSON',
        data: {IdT, anno},
        success:
            function(response)
            {
                $("#presentationText").text(response.raceName + " de " + response.season);

                let html = "";
                response.Results.forEach(element => {
                    console.log(element);
                    //Los elementos toman el nombre json de los models, es decir los nombres tal y como vienen de la api
                    html += "<tr>";
                    html += "<th scope='row'>" + element.position + "</th>";
                    html += "<td>" + element.number + "</td>";
                    html += "<td>" + (element.Driver.givenName + " " + element.Driver.familyName) + "</td>";
                    html += "<td>" + element.Constructor.name + "</td>";
                    html += "<td>" + element.laps + "</td>";
                    html += "<td>" + element.grid + "</td>";
                    if(element.Time == null) html += "<td>" + element.status + "</td>";
                    else html += "<td>" + element.Time.time + "</td>";
                    if(element.fastestLap == null) html += "<td>-</td>";
                    else html += "<td>" + element.fastestLap.Time.time + "</td>";
                    html += "<td>" + element.points + "</td>";
                    html += "</tr>";
                });
                $("#tableWrapper").html(html);
            }
    })
}