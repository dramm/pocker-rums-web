/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pokerweb.Config;

import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

/**
 *
 * @author vadim
 */
public class ConfigManager {
    private InputStream xml;
    private XPath xpath;
    private InputSource inputSource;
    
    public ConfigManager(){
        xml = getClass().getClassLoader().getResourceAsStream("ConfigProp.xml");
        xpath = XPathFactory.newInstance().newXPath();
        inputSource = new InputSource(xml);
    }
    
    public FieldJdbc GetPropJdbc(){
        try {
            FieldJdbc JField=new FieldJdbc();
        
            NodeList node=(NodeList) xpath.evaluate("/root/jdbc/*", inputSource,XPathConstants.NODESET);
            JField.serverName = node.item(0).getTextContent();
            JField.database = node.item(1).getTextContent();
            JField.port=node.item(2).getTextContent();
            JField.username = node.item(3).getTextContent();
            JField.password = node.item(4).getTextContent();
            
            return JField;
        } catch (XPathExpressionException ex) {
            Logger.getLogger(ConfigManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public FieldMail GetPropMail(){
        try {
            FieldMail MField=new FieldMail();
            NodeList node=(NodeList) xpath.evaluate("/root/mail/*", inputSource,XPathConstants.NODESET);
            MField.transport = node.item(0).getTextContent();
            MField.server = node.item(1).getTextContent();
            MField.port=Integer.parseInt(node.item(2).getTextContent());
            MField.login = node.item(3).getTextContent();
            MField.password = node.item(4).getTextContent();
            MField.Subject = node.item(4).getTextContent();
            MField.MessageText = node.item(5).getTextContent();
                
            return MField;
        } catch (XPathExpressionException ex) {
            Logger.getLogger(ConfigManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
