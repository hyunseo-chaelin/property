package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import dto.Property;

public class PropertyRepository {
    
    private ArrayList<Property> listOfproperty = new ArrayList<Property>();
    
    private static PropertyRepository instance = new PropertyRepository();

    public static PropertyRepository getInstance() {
        return instance;
    }
    
    public PropertyRepository() {
        Property property1 = new Property("Prop1234", "빌딩", "3억");
        property1.setDescription("빌딩이다 ");
        property1.setCondition("매매");
        property1.setReleaseDate("2022/10/06");
        property1.setFilename("ISBN1234.jpg");
        property1.setBookmark(true);
        property1.setCity("seoul");
        property1.setDistrict("강동구");
        property1.setArea("153.98/153.98");
        
        Property property2 = new Property("Prop4567", "아파트", "5억");
        property2.setDescription("아파트다");
        property2.setCondition("전세");
        property2.setReleaseDate("2023/01/01");
        property2.setFilename("ISBN1235.jpg");
        property2.setBookmark(false);
        property2.setCity("seoul");
        property2.setDistrict("송파구");
        property2.setArea("259.37/259.37");
        
        listOfproperty.add(property1);
        listOfproperty.add(property2);
    }
    
    public ArrayList<Property> getAllproperty() {
        return listOfproperty;
    }
    
    public Property getPropertyById(String propertyId) {
        Property propertyById = null;
        
        for(int i = 0; i < listOfproperty.size(); i++) {
            Property property = listOfproperty.get(i);
            if (property != null && property.getPropertyID() != null &&
                property.getPropertyID().equals(propertyId)) {
                propertyById = property;
                break;
            }
        }
        return propertyById;
    }
    
    public void addProperty(Property property) {
        listOfproperty.add(property);
    }

    public List<Property> getFilteredProperty(String city, String district) {
        List<Property> allProperties = getAllproperty(); // 모든 매물 가져오기
        return allProperties.stream()
            .filter(property -> (city == null || city.isEmpty() || city.equals(property.getCity())) &&
                                (district == null || district.isEmpty() || district.equals(property.getDistrict())))
            .collect(Collectors.toList());
    }
}
