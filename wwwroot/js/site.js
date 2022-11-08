function CargarModalTrack(idt) {
    let track = '';
    let fotosTrack = '';
    let pais = '';

    $.ajax({
        type: 'POST',
        dataType: "JSON",
        url: '/Home/BuscarTrackAjax',
        data: { IdTrack: idt },
        async: false,
        success:
            function (response) {
                track = response;
            }
    })

    $.ajax({
        type: 'POST',
        dataType: "JSON",
        url: '/Home/BuscarFotosTrackAjax',
        data: { IdTrack: track.id },
        async: false,
        success:
            function (response) {
                fotosTrack = response;
                console.log(fotosTrack);
            }
    })

    $.ajax({
        type: 'POST',
        dataType: "JSON",
        url: '/Home/BuscarPaisAjax',
        data: { IdPais: track.idPais },
        async: false,
        success:
            function (response) {
                pais = response;
            }
    })

    $("#modalInfoPaisLogo").attr("src", pais.logo);
    $("#modalInfoPaisTit").html(track.nombre);

    let bodytxt = "<p>" + track.nombre + " es un track de carreras ubicado en " + pais.pais.nombre + ".</p>";
    bodytxt += "<p> tiene una longitud de " + track.longitud + "km, y fue inaugurado el " + track.fechaInauguracion.substr(0,10) + "</p>";
    bodytxt += "<img src=" + fotosTrack[0] + " class='border rounded mw-100 h-auto'>";
    $("#modalInfoPaisBody").html(bodytxt);

    var modal = new bootstrap.Modal(document.getElementById('modalInfoPais'), {
        keyboard: false
    });
    modal.toggle();
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