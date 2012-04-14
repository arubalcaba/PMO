package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(TurnoverStatusController)
@Mock(TurnoverStatus)
class TurnoverStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/turnoverStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.turnoverStatusInstanceList.size() == 0
        assert model.turnoverStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.turnoverStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.turnoverStatusInstance != null
        assert view == '/turnoverStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/turnoverStatus/show/1'
        assert controller.flash.message != null
        assert TurnoverStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/turnoverStatus/list'


        populateValidParams(params)
        def turnoverStatus = new TurnoverStatus(params)

        assert turnoverStatus.save() != null

        params.id = turnoverStatus.id

        def model = controller.show()

        assert model.turnoverStatusInstance == turnoverStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/turnoverStatus/list'


        populateValidParams(params)
        def turnoverStatus = new TurnoverStatus(params)

        assert turnoverStatus.save() != null

        params.id = turnoverStatus.id

        def model = controller.edit()

        assert model.turnoverStatusInstance == turnoverStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/turnoverStatus/list'

        response.reset()


        populateValidParams(params)
        def turnoverStatus = new TurnoverStatus(params)

        assert turnoverStatus.save() != null

        // test invalid parameters in update
        params.id = turnoverStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/turnoverStatus/edit"
        assert model.turnoverStatusInstance != null

        turnoverStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/turnoverStatus/show/$turnoverStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        turnoverStatus.clearErrors()

        populateValidParams(params)
        params.id = turnoverStatus.id
        params.version = -1
        controller.update()

        assert view == "/turnoverStatus/edit"
        assert model.turnoverStatusInstance != null
        assert model.turnoverStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/turnoverStatus/list'

        response.reset()

        populateValidParams(params)
        def turnoverStatus = new TurnoverStatus(params)

        assert turnoverStatus.save() != null
        assert TurnoverStatus.count() == 1

        params.id = turnoverStatus.id

        controller.delete()

        assert TurnoverStatus.count() == 0
        assert TurnoverStatus.get(turnoverStatus.id) == null
        assert response.redirectedUrl == '/turnoverStatus/list'
    }
}
