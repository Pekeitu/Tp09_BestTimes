function CargarModalTrack(idt) {
    let track = '';
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

    console.log(track);

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

    console.log(pais);

    $("#modalInfoPaisLogo").attr("src", pais.logo);
    $("#modalInfoPaisTit").html(track.nombre);
    //$("#FotoJugador").attr("src", response.foto);
    //$("#NumCamiseta").html("Numero de camiseta: " + response.numCamiseta);
    //$("#FechaNacimiento").html("Fecha de nacimiento: " + response.fechaNacimiento);
    //$("#BtnConfirmarBorrado").attr("href", '@Url.Action("EliminarJugador", "Home")' + "?IdJugador=" + IdJ.toString() + "&IdEquipo=" + IdE.toString());

    var modal = new bootstrap.Modal(document.getElementById('modalInfoPais'), {
        keyboard: false
    });
    modal.toggle();
}