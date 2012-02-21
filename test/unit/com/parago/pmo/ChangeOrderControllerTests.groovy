package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ChangeOrderController)
@Mock(ChangeOrder)
class ChangeOrderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/changeOrder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.changeOrderInstanceList.size() == 0
        assert model.changeOrderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.changeOrderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.changeOrderInstance != null
        assert view == '/changeOrder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/changeOrder/show/1'
        assert controller.flash.message != null
        assert ChangeOrder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/changeOrder/list'


        populateValidParams(params)
        def changeOrder = new ChangeOrder(params)

        assert changeOrder.save() != null

        params.id = changeOrder.id

        def model = controller.show()

        assert model.changeOrderInstance == changeOrder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/changeOrder/list'


        populateValidParams(params)
        def changeOrder = new ChangeOrder(params)

        assert changeOrder.save() != null

        params.id = changeOrder.id

        def model = controller.edit()

        assert model.changeOrderInstance == changeOrder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/changeOrder/list'

        response.reset()


        populateValidParams(params)
        def changeOrder = new ChangeOrder(params)

        assert changeOrder.save() != null

        // test invalid parameters in update
        params.id = changeOrder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/changeOrder/edit"
        assert model.changeOrderInstance != null

        changeOrder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/changeOrder/show/$changeOrder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        changeOrder.clearErrors()

        populateValidParams(params)
        params.id = changeOrder.id
        params.version = -1
        controller.update()

        assert view == "/changeOrder/edit"
        assert model.changeOrderInstance != null
        assert model.changeOrderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/changeOrder/list'

        response.reset()

        populateValidParams(params)
        def changeOrder = new ChangeOrder(params)

        assert changeOrder.save() != null
        assert ChangeOrder.count() == 1

        params.id = changeOrder.id

        controller.delete()

        assert ChangeOrder.count() == 0
        assert ChangeOrder.get(changeOrder.id) == null
        assert response.redirectedUrl == '/changeOrder/list'
    }
}
