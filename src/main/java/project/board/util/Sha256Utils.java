package project.board.util;

import org.springframework.stereotype.Component;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Component
public class Sha256Utils {
	
    public String sha256(String msg){
        MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(msg.getBytes());
			return bytesToHex(md.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
    }
    
    public String sha256(String msg, String salt){
        MessageDigest md;
		try {
			msg = salt + msg;
			md = MessageDigest.getInstance("SHA-256");
			md.update(msg.getBytes());
			return bytesToHex(md.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
    }
	
    public static String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b: bytes) {
          builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
}