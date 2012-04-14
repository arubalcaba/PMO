package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectInvoiceController)
@Mock(ProjectInvoice)
class ProjectInvoiceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectInvoice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectInvoiceInstanceList.size() == 0
        assert model.projectInvoiceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.projectInvoiceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectInvoiceInstance != null
        assert view == '/projectInvoice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectInvoice/show/1'
        assert controller.flash.message != null
        assert ProjectInvoice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInvoice/list'


        populateValidParams(params)
        def projectInvoice = new ProjectInvoice(params)

        assert projectInvoice.save() != null

        params.id = projectInvoice.id

        def model = controller.show()

        assert model.projectInvoiceInstance == projectInvoice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInvoice/list'


        populateValidParams(params)
        def projectInvoice = new ProjectInvoice(params)

        assert projectInvoice.save() != null

        params.id = projectInvoice.id

        def model = controller.edit()

        assert model.projectInvoiceInstance == projectInvoice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInvoice/list'

        response.reset()


        populateValidParams(params)
        def projectInvoice = new ProjectInvoice(params)

        assert projectInvoice.save() != null

        // test invalid parameters in update
        params.id = projectInvoice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectInvoice/edit"
        assert model.projectInvoiceInstance != null

        projectInvoice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectInvoice/show/$projectInvoice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectInvoice.clearErrors()

        populateValidParams(params)
        params.id = projectInvoice.id
        params.version = -1
        controller.update()

        assert view == "/projectInvoice/edit"
        assert model.projectInvoiceInstance != null
        assert model.projectInvoiceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectInvoice/list'

        response.reset()

        populateValidParams(params)
        def projectInvoice = new ProjectInvoice(params)

        assert projectInvoice.save() != null
        assert ProjectInvoice.count() == 1

        params.id = projectInvoice.id

        controller.delete()

        assert ProjectInvoice.count() == 0
        assert ProjectInvoice.get(projectInvoice.id) == null
        assert response.redirectedUrl == '/projectInvoice/list'
    }
}
