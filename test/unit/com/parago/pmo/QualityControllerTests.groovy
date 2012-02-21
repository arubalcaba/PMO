package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(QualityController)
@Mock(Quality)
class QualityControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/quality/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.qualityInstanceList.size() == 0
        assert model.qualityInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.qualityInstance != null
    }

    void testSave() {
        controller.save()

        assert model.qualityInstance != null
        assert view == '/quality/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/quality/show/1'
        assert controller.flash.message != null
        assert Quality.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/quality/list'


        populateValidParams(params)
        def quality = new Quality(params)

        assert quality.save() != null

        params.id = quality.id

        def model = controller.show()

        assert model.qualityInstance == quality
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/quality/list'


        populateValidParams(params)
        def quality = new Quality(params)

        assert quality.save() != null

        params.id = quality.id

        def model = controller.edit()

        assert model.qualityInstance == quality
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/quality/list'

        response.reset()


        populateValidParams(params)
        def quality = new Quality(params)

        assert quality.save() != null

        // test invalid parameters in update
        params.id = quality.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/quality/edit"
        assert model.qualityInstance != null

        quality.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/quality/show/$quality.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        quality.clearErrors()

        populateValidParams(params)
        params.id = quality.id
        params.version = -1
        controller.update()

        assert view == "/quality/edit"
        assert model.qualityInstance != null
        assert model.qualityInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/quality/list'

        response.reset()

        populateValidParams(params)
        def quality = new Quality(params)

        assert quality.save() != null
        assert Quality.count() == 1

        params.id = quality.id

        controller.delete()

        assert Quality.count() == 0
        assert Quality.get(quality.id) == null
        assert response.redirectedUrl == '/quality/list'
    }
}
