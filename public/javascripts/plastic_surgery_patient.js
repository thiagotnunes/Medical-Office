pages = new Array('divPersonalInformation', 'divPatientHistoryInformation', 'divPatientClinicalInformation', 'divPatientSurgeryInformation', 'divEvolutionInformation')

var current_page = 0

document.observe("dom:loaded", function() {
    for (i = 1; i < pages.length; i++) {
        $(pages[i]).hide()
    }
})

function link_to_previous() {
    $(pages[current_page]).hide()
    current_page == 0 ? current_page = 0 : current_page = current_page - 1
    $(pages[current_page]).show()
}

function link_to_next() {
    $(pages[current_page]).hide()
    current_page == pages.length - 1 ? current_page = current_page : current_page = current_page + 1
    $(pages[current_page]).show()
}
