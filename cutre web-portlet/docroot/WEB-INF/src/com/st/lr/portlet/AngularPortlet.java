package com.st.lr.portlet;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class AngularPortlet
 */
public class AngularPortlet extends MVCPortlet {

	@Override
	public void serveResource(ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {
		String id = resourceRequest.getParameter("id");
		if(id == null){
			//serveResource1(resourceRequest, resourceResponse);
			return;
		}
		include(id+".jsp", resourceRequest, resourceResponse);
		
		return;
	}
	
	@Override
	protected void include(String path, ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {
		super.include(path, resourceRequest, resourceResponse);
	}

}
