package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ManagmentInfoController)
@Mock(ManagmentInfo)
class ManagmentInfoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/managmentInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.managmentInfoInstanceList.size() == 0
        assert model.managmentInfoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.managmentInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.managmentInfoInstance != null
        assert view == '/managmentInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/managmentInfo/show/1'
        assert controller.flash.message != null
        assert ManagmentInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/managmentInfo/list'


        populateValidParams(params)
        def managmentInfo = new ManagmentInfo(params)

        assert managmentInfo.save() != null

        params.id = managmentInfo.id

        def model = controller.show()

        assert model.managmentInfoInstance == managmentInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/managmentInfo/list'


        populateValidParams(params)
        def managmentInfo = new ManagmentInfo(params)

        assert managmentInfo.save() != null

        params.id = managmentInfo.id

        def model = controller.edit()

        assert model.managmentInfoInstance == managmentInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/managmentInfo/list'

        response.reset()


        populateValidParams(params)
        def managmentInfo = new ManagmentInfo(params)

        assert managmentInfo.save() != null

        // test invalid parameters in update
        params.id = managmentInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/managmentInfo/edit"
        assert model.managmentInfoInstance != null

        managmentInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/managmentInfo/show/$managmentInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        managmentInfo.clearErrors()

        populateValidParams(params)
        params.id = managmentInfo.id
        params.version = -1
        controller.update()

        assert view == "/managmentInfo/edit"
        assert model.managmentInfoInstance != null
        assert model.managmentInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/managmentInfo/list'

        response.reset()

        populateValidParams(params)
        def managmentInfo = new ManagmentInfo(params)

        assert managmentInfo.save() != null
        assert ManagmentInfo.count() == 1

        params.id = managmentInfo.id

        controller.delete()

        assert ManagmentInfo.count() == 0
        assert ManagmentInfo.get(managmentInfo.id) == null
        assert response.redirectedUrl == '/managmentInfo/list'
    }
}
