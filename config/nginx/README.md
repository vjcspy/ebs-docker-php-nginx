## Cài đặt mkcert
Hiện tại mkcert hỗ trợ đa nền tảng như macOS, Linux, Windows. Các bạn có thể coi cách cài đặt cho từng hệ điều hành trên GitHub repo của mkcert

```bash
$ brew install mkcert
$ brew install nss # if you use Firefox
```
    
## Sử dụng mkcert
Đầu tiên chúng ta cần phải tạo một certificate authority (CA). CA này sẽ được lưu trên máy tính của chúng ta.

```bash
$ mkcert -install
Using the local CA at "/Users/vjcspy/Library/Application Support/mkcert" ✨
The local CA is now installed in the system trust store! ⚡️
The local CA is now installed in the Firefox trust store (requires browser restart)! 🦊
```

## Tạo certificate cho host
Bạn có thể tạo certificate cho nhiều host, IP cùng lúc như sau:

```bash
$ mkcert localhost upward.lc bom.lc ticket.lc mgt.lc
Using the local CA at "/Users/vjcspy/Library/Application Support/mkcert" ✨

Created a new certificate valid for the following names 📜
 - "localhost"
 - "upward.lc"
 - "bom.lc"
 - "ticket.lc"
 - "mgt.lc"

The certificate is at "./localhost+4.pem" and the key at "./localhost+4-key.pem" ✅
```
Sau khi câu lệnh chạy xong, bạn sẽ thấy 2 file là localhost+4.pem và localhost+4-key.pem được tạo