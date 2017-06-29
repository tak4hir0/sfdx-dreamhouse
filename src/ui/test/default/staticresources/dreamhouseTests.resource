/**
 * This is a 'hello world' jasmine test spec file.
 * These examples show the "shape" of a Jasmine spec.
 */
describe('Dreamhouse Lightning Component tests', function() {

    describe('c:IQPictureUploader', function() {

        // These tests are making server-side calls and interacting with LDS events,
        // so increase the default timeout to reduce tests flappiness
        var originalTimeout;
        var defaultTimeout = 10000;

        beforeEach(function(done) {
            originalTimeout = jasmine.DEFAULT_TIMEOUT_INTERVAL;
            jasmine.DEFAULT_TIMEOUT_INTERVAL = defaultTimeout;

            // Create a record in advance, for use with the Save, Reload and Delete actions
            var that = this;
            var renderInto = document.getElementById("renderTestComponents");
            $T.createComponent("c:IQPictureUploader", {}, renderInto)
            .then(function(component){
                that.component = component;
            }).then(function() {
                done();
            }).catch(function(e) {
                done.fail(e);
            });
        });

        afterEach(function() {
            // Each spec (test) renders its components into the same div,
            // so we need to clear that div out at the end of each spec.
            $T.clearRenderedTestComponents();
            jasmine.DEFAULT_TIMEOUT_INTERVAL = originalTimeout;
        });

        it('check that the property type is properly configured', function() {
            expect(this.component.find("card").get("v.footer")).toContain("Powered by Einstein");
        });

    });
});