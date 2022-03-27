package utility;
import java.util.*;
import org.hibernate.*;
import bean.*;
public class Run {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SessionFactory sesionFactory = HibernateConnection.doHibernateConnection();
		Session session = sesionFactory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			
			
					Calendar calen1 = Calendar.getInstance();
					calen1.set(2019,11,22);
					Calendar calen2 = Calendar.getInstance();
					calen2.set(2019,11,23);
					Calendar calen3 = Calendar.getInstance();
					calen3.set(2019,11,24);
					Calendar calen4 = Calendar.getInstance();
					calen4.set(2019,9,16,00,00,00);
					Activity a1 = new Activity("0001","1","การจัดสวนถาด",calen1,"ลานหน้าอาคารพืชศาสตร์",2,0,0);
					Activity a2 = new Activity("0002","1","การแข่งขันเซทแมลง",calen1,"ลานหน้าอาคารพืชศาสตร์",1,0,0);
					Activity a3 = new Activity("0003","1","การผลิตแผ่นประชาสัมพันธ์เพื่อส่งเสริมการเกษตร",calen1,"ห้องเทคโนโลยีสารสนเทศ 104 ( ห้อง C ) อาคารเรียนรวม 70 ปี",2,0,0);
					Activity a4 = new Activity("0004","1","การตอนสุกร",calen1,"ข้างอาคารสมิตานนท์",2,1,1);
					Activity a5 = new Activity("0005","1","การรีดเต้านมเทียม",calen1,"ใต้อาคารสมิตานนท์",1,0,0);
					Activity a6 = new Activity("0006","1","การประกวดโมเดลธุรกิจนวัตกรรมการเกษตร",calen1,"FT 1101 คณะเทคโนโลยีการประมง",3,0,0);
					Activity a7 = new Activity("0007","1","การแข่งขันบรรจุพันธุ์ลูกปลา",calen1,"อาคารปฏิบัติการ คณะเทคโนโลยีการประมง",3,0,0);
					Activity a8 = new Activity("0008","1","การขยายพันธุ์พืช-ติดตา-ต่อกิ่ง-ทาบกิ่ง",calen2,"อาคารปฏิบัติการฟาร์มพืชไร่",2,0,0);
					Activity a9 = new Activity("0009","1","การเข้าด้ามจอบเตรียมแปลง",calen2,"แปลงฟาร์มพืชไร่/พืชผัก",2,1,1);
					Activity a10 = new Activity("0010","1","การประเมินเนื้อดินโดยวิธีภาคสนามและการวัดค่า pH ของดิน",calen2,"SE 403 อาคารปฐพี",1,0,0);
					Activity a11 = new Activity("0011","1","การพูดส่งเสริมทางการเกษตร",calen2,"PT 106 และ PT 117 อาคารพืชศาสตร์",2,0,0);
					Activity a12 = new Activity("0012","1","การตัดแต่งซากสัตว์ปีก",calen2,"ห้องปฏิบัติการ สมิตานนท์ (2 ห้อง)",2,1,1);
					Activity a13 = new Activity("0013","1","การวิเคราะห์อาหารสัตว์",calen2,"PT 420 อาคารพืขศาสตร์ (2 ห้อง), PT 212",1,0,0);
					Activity a14 = new Activity("0014","1","การทอดแห",calen2,"ลานกีฬา คณะเทคโนโลยีการประมง",2,0,0);
					Activity a15 = new Activity("0015","1","การกรอกวัสดุปลูกใส่ถุง",calen3,"อาคารสมิตานนท์",2,1,1);
					Activity a16 = new Activity("0016","1","การคำนวณอัตราการใช้และการพ่นสารกำจัดวัชพืช",calen3,"PT 209 อาคารพืชศาสตร์ / ข้างอาคารพืชศาสตร์",3,1,1);
					Activity a17 = new Activity("0017","1","การวินิจฉัยโรคพืช",calen3,"PT410 เป็น PT401 ",2,0,0);
					Activity a18 = new Activity("0018","1","การตอบปัญหาทางการเกษตร",calen3,"PT 106 และ PT 117 อาคารพืชศาสตร์",2,0,0);
					Activity a19 = new Activity("0019","1","โครงงานทางการเกษตร",calen3,"PT 309 และ PT 3xx/412 อาคารพืชศาสตร์",3,0,0);
					Activity a20 = new Activity("0020","1","การคล้องโคและล้มโค",calen3,"ข้างอาคารสมิตานนท์",4,0,0);
					Activity a21 = new Activity("0021","2","บาสเกตบอลหญิง",calen1,"inthanin",12,0,12);
					Activity a22 = new Activity("0022","2","วอลเลย์บอลหญิง",calen1,"inthanin",12,0,12); 
					Activity a23 = new Activity("0023","2","ฟุตบอลชาย",calen1,"inthanin",12,12,0); 
					Activity a24 = new Activity("0024","2","ตะกร้อชาย",calen1,"inthanin",5,5,0);
					Activity a25 = new Activity("0025","3","แข่งขันสปิริตเชียร์",calen1,"inthanin",30,0,0);
					Activity a26 = new Activity("0026","3","ประกวดหนุ่มลูกทุ่ง",calen1,"inthanin",1,1,0);
					Activity a27 = new Activity("0027","3","น้องนางบ้านนา",calen1,"inthanin",1,0,1);
					Activity a28 = new Activity("0028","3","หญิงสาวชาวสวน",calen1,"inthanin",1,0,1); 

					session.save(a1);
					session.save(a2);
					session.save(a3);
					session.save(a4);
					session.save(a5);
					session.save(a6);
					session.save(a7);
					session.save(a8);
					session.save(a9);
					session.save(a10);
					session.save(a11);
					session.save(a12);
					session.save(a13);
					session.save(a14);
					session.save(a15);
					session.save(a16);
					session.save(a17);
					session.save(a18);
					session.save(a19);
					session.save(a20);
					session.save(a21);
					session.save(a22);
					session.save(a23);
					session.save(a24);
					session.save(a25);
					session.save(a26);
					session.save(a27);
					session.save(a28);
					

					
					University u1 = new University("KU","8rit","มหาวิทยลัยเกษตรศาสตร์",calen4,0);
					University u2 = new University("KKU","b0ce","มหาวิทยาลัยขอนแก่น",calen4,0);
					University u3 = new University("CMU","rix9","มหาวิทยาลัยเชียงใหม่",calen4,0);
					University u4 = new University("TSU","1ora","มหาวิทยาลัยทักษิณ",calen4,0);
					University u5 = new University("TU","sp9j","มหาวิทยาลัยธรรมศาสตร์",calen4,0);
					University u6 = new University("NU","we2p","มหาวิทยาลัยนเรศวร",calen4,0);
					University u7 = new University("MSU","tru6","มหาวิทยาลัยมหาสารคาม",calen4,0);
					University u8 = new University("SU","p9re","มหาวิทยาลัยศิลปากร",calen4,0);
					University u9 = new University("PSU","jis8","มหาวิทยาลัยสงขลานครินทร์",calen4,0);
					University u10 = new University("UBU","5ani","มหาวิทยาลัยอุบลราชธานี",calen4,0);
					University u11 = new University("KMITL","m9zi","สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง",calen4,0);
					University u12 = new University("MJU","mjuRegis","มหาวิทยาลัยแม่โจ้",calen4,0);
				
					University u13 = new University("UP","he0u","มหาวิทยาลัยพะเยา",calen4,50);
					University u14 = new University("MAHIDOL","n0xu","มหาวิทยาลัยมหิดล",calen4,50);
					University u15 = new University("Admin4Jobb","tr2c","adminmju",calen4,0);
					session.save(u1);
					session.save(u2);
					session.save(u3);
					session.save(u4);
					session.save(u5);
					session.save(u6);
					session.save(u7);
					session.save(u8);
					session.save(u9);
					session.save(u10);
					session.save(u11);
					session.save(u12);
					session.save(u13);
					session.save(u14);
					session.save(u15);
					Faculty fac1 = new Faculty("01","คณะเกษตร",u1);
					Faculty fac2 = new Faculty("02","คณะเกษตรศาสตร์",u2);
					Faculty fac3 = new Faculty("03","คณะเกษตรศาสตร์",u3);
					Faculty fac4 = new Faculty("04","คณะเทคโนโลยีและการพัฒนาชุมชน",u4);
					Faculty fac5 = new Faculty("05","คณะวิทยาศาสตร์และเทคโนโลยี",u5);
					Faculty fac6 = new Faculty("06","คณะเกษตรศาสตร์ทรัพยากรธรรมชาติและสิ่งแวดล้อม",u6);
					Faculty fac7 = new Faculty("07","คณะเทคโนโลยี ",u7);
					Faculty fac8 = new Faculty("08","คณะสัตวศาสตร์และเทคโนโลยีการเกษตร ",u8);
					Faculty fac9 = new Faculty("09","คณะทรัพยากรธรรมชาติ",u9);
					Faculty fac10 = new Faculty("10","คณะเกษตรศาสตร์",u10);
					Faculty fac11 = new Faculty("11","คณะเทคโนโลยีการเกษตร",u11);
					Faculty fac12 = new Faculty("12","คณะผลิตกรรมการเกษตร",u12);
					Faculty fac13 = new Faculty("13","คณะสัตวศาสตร์และเทคโนโลยี",u12);
					Faculty fac14 = new Faculty("14","คณะเทคโนโลยีการประมงและทรัพยากรทางน้ำ",u12);
					Faculty fac15 = new Faculty("15","มหาวิทยาลัยสังเกตการณ์",u13);
					Faculty fac16 = new Faculty("16","มหาวิทยาลัยสังเกตการณ์",u14);

					session.save(fac1);
					session.save(fac2);
					session.save(fac3);
					session.save(fac4);
					session.save(fac5);
					session.save(fac6);
					session.save(fac7);
					session.save(fac8);
					session.save(fac9);
					session.save(fac10);
					session.save(fac11);
					session.save(fac12);
					session.save(fac13);
					session.save(fac14);
					session.save(fac15);
					session.save(fac16);
					
			tx.commit();
			System.out.println("insert successfully!!");
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
			System.out.println("insert failed!!");
		}finally {
			session.close();
		}
		sesionFactory.close();

	}

}
