# Sử dụng một image nền có sẵn Java và Tomcat
FROM tomcat:10.1-jdk21-temurin

# Xóa các ứng dụng web mặc định của Tomcat (không bắt buộc nhưng nên làm)
RUN rm -rf /usr/local/tomcat/webapps/*

# (Quan trọng) Copy file .war được build bởi Maven vào thư mục webapps của Tomcat
# Tên file .war phải khớp với tên trong file pom.xml của bạn
# Đặt tên là ROOT.war để ứng dụng chạy ở đường dẫn gốc (/)
COPY target/UTEShop.war /usr/local/tomcat/webapps/ROOT.war

# Cổng mặc định của Tomcat là 8080, Render sẽ tự động nhận diện
EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]