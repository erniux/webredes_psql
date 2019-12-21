$(document).on 'change', '.new_revisiones #cert_escolar_revisiones', ->
  $('.file_name').html($('#cert_escolar_revisiones').val().replace /^.*[\\\/]/, '')