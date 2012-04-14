package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(InvoiceStatusController)
@Mock(InvoiceStatus)
class InvoiceStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/invoiceStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.invoiceStatusInstanceList.size() == 0
        assert model.invoiceStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.invoiceStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.invoiceStatusInstance != null
        assert view == '/invoiceStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/invoiceStatus/show/1'
        assert controller.flash.message != null
        assert InvoiceStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/invoiceStatus/list'


        populateValidParams(params)
        def invoiceStatus = new InvoiceStatus(params)

        assert invoiceStatus.save() != null

        params.id = invoiceStatus.id

        def model = controller.show()

        assert model.invoiceStatusInstance == invoiceStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/invoiceStatus/list'


        populateValidParams(params)
        def invoiceStatus = new InvoiceStatus(params)

        assert invoiceStatus.save() != null

        params.id = invoiceStatus.id

        def model = controller.edit()

        assert model.invoiceStatusInstance == invoiceStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/invoiceStatus/list'

        response.reset()


        populateValidParams(params)
        def invoiceStatus = new InvoiceStatus(params)

        assert invoiceStatus.save() != null

        // test invalid parameters in update
        params.id = invoiceStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/invoiceStatus/edit"
        assert model.invoiceStatusInstance != null

        invoiceStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/invoiceStatus/show/$invoiceStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        invoiceStatus.clearErrors()

        populateValidParams(params)
        params.id = invoiceStatus.id
        params.version = -1
        controller.update()

        assert view == "/invoiceStatus/edit"
        assert model.invoiceStatusInstance != null
        assert model.invoiceStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/invoiceStatus/list'

        response.reset()

        populateValidParams(params)
        def invoiceStatus = new InvoiceStatus(params)

        assert invoiceStatus.save() != null
        assert InvoiceStatus.count() == 1

        params.id = invoiceStatus.id

        controller.delete()

        assert InvoiceStatus.count() == 0
        assert InvoiceStatus.get(invoiceStatus.id) == null
        assert response.redirectedUrl == '/invoiceStatus/list'
    }
}
