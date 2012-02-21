package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ImpedimentController)
@Mock(Impediment)
class ImpedimentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/impediment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.impedimentInstanceList.size() == 0
        assert model.impedimentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.impedimentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.impedimentInstance != null
        assert view == '/impediment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/impediment/show/1'
        assert controller.flash.message != null
        assert Impediment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/impediment/list'


        populateValidParams(params)
        def impediment = new Impediment(params)

        assert impediment.save() != null

        params.id = impediment.id

        def model = controller.show()

        assert model.impedimentInstance == impediment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/impediment/list'


        populateValidParams(params)
        def impediment = new Impediment(params)

        assert impediment.save() != null

        params.id = impediment.id

        def model = controller.edit()

        assert model.impedimentInstance == impediment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/impediment/list'

        response.reset()


        populateValidParams(params)
        def impediment = new Impediment(params)

        assert impediment.save() != null

        // test invalid parameters in update
        params.id = impediment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/impediment/edit"
        assert model.impedimentInstance != null

        impediment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/impediment/show/$impediment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        impediment.clearErrors()

        populateValidParams(params)
        params.id = impediment.id
        params.version = -1
        controller.update()

        assert view == "/impediment/edit"
        assert model.impedimentInstance != null
        assert model.impedimentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/impediment/list'

        response.reset()

        populateValidParams(params)
        def impediment = new Impediment(params)

        assert impediment.save() != null
        assert Impediment.count() == 1

        params.id = impediment.id

        controller.delete()

        assert Impediment.count() == 0
        assert Impediment.get(impediment.id) == null
        assert response.redirectedUrl == '/impediment/list'
    }
}
