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
        Property property1 = new Property("Prop1234", "프팰", "3억");
        property1.setDescription("아 진짜 자궁년 뒤질놈 진짜 배가 너무 아픈데 이와중에 개발을 해야하는 내 자신이 진짜 너무 힘들고 엿같고 세상이 억까하는 것 같고 진짜 너무 힘들다 진짜 에바적으로 힘들어 진짜 너문머눔너무너문머누먼무너무넘누머ㅜ 아파 살려줘 ");
        property1.setCondition("매매");
        property1.setReleaseDate("2022/10/06");
        property1.setFilename("ISBN1234.jpg");
        property1.setBookmark(true);
        property1.setCity("seoul");
        property1.setDistrict("강동구");
        property1.setArea("153.98/153.98");
        property1.setKind("아파트");
        
        Property property2 = new Property("Prop4567", "롯캐", "5억");
        property2.setDescription("내 시간을 되돌려줘 제발 나 일요일로 다시 돌아갈래 너무 힘들어 눈물나 엉엉 제발 살려줘 살려달라구 응 ? 이거 백자 이제 넘지 않을까 내가 생각하기엔 넘을거같은데 진짜 제발 넘겟지? 페이지 안날라가겠찌 ? 자궁년 시발놈 자궁아 정신차려 나 시험기간이야 ㅗㅗ");
        property2.setCondition("전세");
        property2.setReleaseDate("2023/01/01");
        property2.setFilename("ISBN1235.jpg");
        property2.setBookmark(false);
        property2.setCity("seoul");
        property2.setDistrict("송파구");
        property2.setArea("259.37/259.37");
        
        Property property3 = new Property("Prop5656", "배켠", "5656억");
        property3.setDescription("변백현 사랑해 변백현 사랑해 변백현 얼른 한국와 오프뛰고싶다 빨리와 안전비행하고 알겟지 ? 응 좋아 조심히 오늘까지 수고햇다 어케 스케를 그렇게 뛰니 존나 힘들지도 ㅇ낳니? 대단하다 진짜 하아 나도 얼른 이 스케가 끄탄면 좋겟는데 나는 왜 안끝날까 응 ? ㅎ헤ㅔㅎ");
        property3.setCondition("아파트");
        property3.setReleaseDate("2023/05/06");
        property3.setFilename("BBH56.jpg");
        property3.setBookmark(false);
        property3.setCity("seoul");
        property3.setDistrict("강남구");
        property3.setArea("556.57/56.56");
        
        listOfproperty.add(property1);
        listOfproperty.add(property2);
        listOfproperty.add(property3);
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
