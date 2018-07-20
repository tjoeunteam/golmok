package golmok.team.vo;

public class MapVO {
	public String STORE_1TYPE_CODE;
	public String STORE_1TYPE_NAME;
	public String STORE_2TYPE_CODE;
	public String STORE_2TYPE_NAME;
	public String STORE_TYPE_CODE;
	public String STORE_TYPE_NAME;
	public String STORE_CODE;
	public String STORE_NAME;
	//추가
	public int sale_code;
	public String type_name;
	public String golmok_type_code;
	public String es_type;
	public String sale_name;
	public String SALE_SEVICE_NAME;
	public String sale_service_code;
	public long score;
	public int earn;
	public int sale_store_count;
	//추가
	public float STORE_Y;
	public float STORE_X;
	public String getSTORE_1TYPE_CODE() {
		return STORE_1TYPE_CODE;
	}

	
	


	public String getSTORE_1TYPE_NAME() {
		return STORE_1TYPE_NAME;
	}





	public void setSTORE_1TYPE_NAME(String sTORE_1TYPE_NAME) {
		STORE_1TYPE_NAME = sTORE_1TYPE_NAME;
	}





	public String getSTORE_2TYPE_CODE() {
		return STORE_2TYPE_CODE;
	}





	public void setSTORE_2TYPE_CODE(String sTORE_2TYPE_CODE) {
		STORE_2TYPE_CODE = sTORE_2TYPE_CODE;
	}





	public String getSTORE_2TYPE_NAME() {
		return STORE_2TYPE_NAME;
	}





	public void setSTORE_2TYPE_NAME(String sTORE_2TYPE_NAME) {
		STORE_2TYPE_NAME = sTORE_2TYPE_NAME;
	}





	public String getSTORE_TYPE_CODE() {
		return STORE_TYPE_CODE;
	}





	public void setSTORE_TYPE_CODE(String sTORE_TYPE_CODE) {
		STORE_TYPE_CODE = sTORE_TYPE_CODE;
	}





	public String getSTORE_TYPE_NAME() {
		return STORE_TYPE_NAME;
	}





	public void setSTORE_TYPE_NAME(String sTORE_TYPE_NAME) {
		STORE_TYPE_NAME = sTORE_TYPE_NAME;
	}





	public String getSTORE_CODE() {
		return STORE_CODE;
	}





	public void setSTORE_CODE(String sTORE_CODE) {
		STORE_CODE = sTORE_CODE;
	}





	public String getSTORE_NAME() {
		return STORE_NAME;
	}





	public void setSTORE_NAME(String sTORE_NAME) {
		STORE_NAME = sTORE_NAME;
	}





	public int getSale_code() {
		return sale_code;
	}





	public void setSale_code(int sale_code) {
		this.sale_code = sale_code;
	}





	public String getType_name() {
		return type_name;
	}





	public void setType_name(String type_name) {
		this.type_name = type_name;
	}





	public String getGolmok_type_code() {
		return golmok_type_code;
	}





	public void setGolmok_type_code(String golmok_type_code) {
		this.golmok_type_code = golmok_type_code;
	}





	public String getEs_type() {
		return es_type;
	}





	public void setEs_type(String es_type) {
		this.es_type = es_type;
	}





	public String getSale_name() {
		return sale_name;
	}





	public void setSale_name(String sale_name) {
		this.sale_name = sale_name;
	}





	public String getSALE_SEVICE_NAME() {
		return SALE_SEVICE_NAME;
	}





	public void setSALE_SEVICE_NAME(String sALE_SEVICE_NAME) {
		SALE_SEVICE_NAME = sALE_SEVICE_NAME;
	}





	public String getSale_service_code() {
		return sale_service_code;
	}





	public void setSale_service_code(String sale_service_code) {
		this.sale_service_code = sale_service_code;
	}





	public long getScore() {
		return score;
	}





	public void setScore(long score) {
		this.score = score;
	}





	public int getEarn() {
		return earn;
	}





	public void setEarn(int earn) {
		this.earn = earn;
	}





	public int getSale_store_count() {
		return sale_store_count;
	}





	public void setSale_store_count(int sale_store_count) {
		this.sale_store_count = sale_store_count;
	}





	public float getSTORE_Y() {
		return STORE_Y;
	}





	public void setSTORE_Y(float sTORE_Y) {
		STORE_Y = sTORE_Y;
	}





	public float getSTORE_X() {
		return STORE_X;
	}





	public void setSTORE_X(float sTORE_X) {
		STORE_X = sTORE_X;
	}





	public void setSTORE_1TYPE_CODE(String sTORE_1TYPE_CODE) {
		STORE_1TYPE_CODE = sTORE_1TYPE_CODE;
	}





	@Override
	public String toString() {
		return "MapVO [STORE_1TYPE_CODE=" + STORE_1TYPE_CODE + ", STORE_1TYPE_NAME=" + STORE_1TYPE_NAME
				+ ", STORE_2TYPE_CODE=" + STORE_2TYPE_CODE + ", STORE_2TYPE_NAME=" + STORE_2TYPE_NAME
				+ ", STORE_TYPE_CODE=" + STORE_TYPE_CODE + ", STORE_TYPE_NAME=" + STORE_TYPE_NAME + ", STORE_CODE="
				+ STORE_CODE + ", STORE_NAME=" + STORE_NAME + ", sale_code=" + sale_code + ", type_name=" + type_name
				+ ", golmok_type_code=" + golmok_type_code + ", es_type=" + es_type + ", sale_name=" + sale_name
				+ ", SALE_SEVICE_NAME=" + SALE_SEVICE_NAME + ", sale_service_code=" + sale_service_code + ", score="
				+ score + ", earn=" + earn + ", sale_store_count=" + sale_store_count + ", STORE_Y=" + STORE_Y
				+ ", STORE_X=" + STORE_X + "]";
	}





	public MapVO() {}
}
