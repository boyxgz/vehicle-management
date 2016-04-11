package com.surelution.vms



import org.junit.*
import grails.test.mixin.*

@TestFor(InsurerController)
@Mock(Insurer)
class InsurerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/insurer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.insurerInstanceList.size() == 0
        assert model.insurerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.insurerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.insurerInstance != null
        assert view == '/insurer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/insurer/show/1'
        assert controller.flash.message != null
        assert Insurer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/insurer/list'

        populateValidParams(params)
        def insurer = new Insurer(params)

        assert insurer.save() != null

        params.id = insurer.id

        def model = controller.show()

        assert model.insurerInstance == insurer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/insurer/list'

        populateValidParams(params)
        def insurer = new Insurer(params)

        assert insurer.save() != null

        params.id = insurer.id

        def model = controller.edit()

        assert model.insurerInstance == insurer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/insurer/list'

        response.reset()

        populateValidParams(params)
        def insurer = new Insurer(params)

        assert insurer.save() != null

        // test invalid parameters in update
        params.id = insurer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/insurer/edit"
        assert model.insurerInstance != null

        insurer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/insurer/show/$insurer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        insurer.clearErrors()

        populateValidParams(params)
        params.id = insurer.id
        params.version = -1
        controller.update()

        assert view == "/insurer/edit"
        assert model.insurerInstance != null
        assert model.insurerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/insurer/list'

        response.reset()

        populateValidParams(params)
        def insurer = new Insurer(params)

        assert insurer.save() != null
        assert Insurer.count() == 1

        params.id = insurer.id

        controller.delete()

        assert Insurer.count() == 0
        assert Insurer.get(insurer.id) == null
        assert response.redirectedUrl == '/insurer/list'
    }
}
