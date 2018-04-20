@isTest
private class ParkLocatorTest {
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String country = 'United States';
        List<String> result = ParkLocator.country(country);

        System.assertEquals(new List<String>{'Acadia', 'Arches', 'Badlands'}, result);
    }
}