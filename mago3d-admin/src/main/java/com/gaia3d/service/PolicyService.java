package com.gaia3d.service;

import com.gaia3d.domain.Policy;

/**
 * 위젯
 * @author jeongdae
 *
 */
public interface PolicyService {
	
	/**
	 * 운영 정책 정보
	 * @return
	 */
	Policy getPolicy();
	
	/**
	 * 운영 정책 사용자 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyUser(Policy policy);
	
	/**
	 * 운영 정책 패스워드 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyPassword(Policy policy);
	
	/**
	 * 공간 정보 기본 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyGeo(Policy policy);
	
	/**
	 * Geo Server 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyGeoServer(Policy policy);
	
	/**
	 * CallBack Function 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyGeoCallBack(Policy policy);
	
	/**
	 * 운영 정책 알림 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyNotice(Policy policy);
	
	/**
	 * 운영 정책 보안 수정
	 * @param policy
	 * @return
	 */
	int updatePolicySecurity(Policy policy);
	
	/**
	 * 운영 정책 기타 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyContent(Policy policy);
	
	/**
	 * 사용자 파일 업로딩 정책 수정
	 * @param policy
	 * @return
	 */
	int updatePolicyUserUpload(Policy policy);
	
	/**
	 * 사이트 정보 수정
	 * @param policy
	 * @return
	 */
	int updatePolicySite(Policy policy);
	
	/**
	 * BackOffice 설정
	 * @param policy
	 * @return
	 */
	int updatePolicyBackoffice(Policy policy);
	
	/**
	 * 제품정보 설정
	 * @param policy
	 * @return
	 */
	int updatePolicySolution(Policy policy);
}
