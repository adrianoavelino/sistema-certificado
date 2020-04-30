$(function() {
  $.fn.singleDatePicker = function() {
    $(this).on("apply.daterangepicker", function(e, picker) {
      picker.element.val(picker.startDate.format(picker.locale.format));
    });
    return $(this).daterangepicker({
      singleDatePicker: true,
      autoUpdateInput: false,
      minDate: getMindate(),
      maxDate: getMaxdate(),
      locale: {
        format: "DD/MM/YYYY",
        separator: " - ",
        applyLabel: "Aplicar",
        cancelLabel: "Cancelar",
        daysOfWeek: [
          "Dom",
          "Seg",
          "Ter",
          "Qua",
          "Qui",
          "Sex",
          "Sab"
        ],
        monthNames: [
          "Janeiro",
          "Fevereiro",
          "Março",
          "Abril",
          "Maio",
          "Junho",
          "Julho",
          "Agosto",
          "Setembro",
          "Outubro",
          "Novembro",
          "Dezembro"
        ],
        firstDay: 1
      }
    });
  };

  function getMaxdate() {
    let today = new Date();
    return new Date(today.setMonth(today.getMonth() + 1))
  }

  function getMindate() {
    let today = new Date();
    return new Date(today.setMonth(today.getMonth() - 100))
  }

  $("#certificate_date_issue, #certificate_initial_period, #certificate_final_period").singleDatePicker();

  $("#type").change(function(){
    if ($(this).val() === 'data_emissao') {
      $("#term").singleDatePicker();
      return;
    }
    $("#term").data('daterangepicker').remove();
    $("#term").val("");
  });

  if ($("#type").val() == 'data_emissao') {
      $("#term").singleDatePicker();
  }


});
