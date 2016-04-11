package com.surelution.vms



import org.junit.*
import grails.test.mixin.*

@TestFor(InsureController)
@Mock(Insure)
class InsureControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/insure/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.insureInstanceList.size() == 0
        assert model.insureInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.insureInstance != null
    }

    void testSave() {
        controller.save()

        assert model.insureInstance != null
        assert view == '/insure/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/insure/show/1'
        assert controller.flash.message != null
        assert Insure.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/insure/list'

        populateValidParams(params)
        def insure = new Insure(params)

        assert insure.save() != null

        params.id = insure.id

        def model = controller.show()

        assert model.insureInstance == insure
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/insure/list'

        populateValidParams(params)
        def insure = new Insure(params)

        assert insure.save() != null

        params.id = insure.id

        def model = controller.edit()

        assert model.insureInstance == insure
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/insure/list'

        response.reset()

        populateValidParams(params)
        def insure = new Insure(params)

        assert insure.save() != null

        // test invalid parameters in update
        params.id = insure.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/insure/edit"
        assert model.insureInstance != null

        insure.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/insure/show/$insure.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        insure.clearErrors()

        populateValidParams(params)
        params.id = insure.id
        params.version = -1
        controller.update()

        assert view == "/insure/edit"
        assert model.insureInstance != null
        assert model.insureInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/insure/list'

        response.reset()

        populateValidParams(params)
        def insure = new Insure(params)

        assert insure.save() != null
        assert Insure.count() == 1

        params.id = insure.id

        controller.delete()

        assert Insure.count() == 0
        assert Insure.get(insure.id) == null
        assert response.redirectedUrl == '/insure/list'
    }
}
