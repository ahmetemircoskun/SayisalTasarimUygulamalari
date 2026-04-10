# Çalışma 6

## Soru
<img width="699" height="597" alt="Soru_6" src="https://github.com/user-attachments/assets/2d8d9abc-4d91-438b-b0e5-bcde32ae4c41" />

Kurallar:

- Modül 2 bitlik iki giriş alıp 8 çıkış verecektir.

- Giriş: val1 [1:0], val2 [1:0], 2 bitlik iki değer

- Çıkış Portları:
  - a, üst yere paralel segmenti sembolize eden bir bitlik değer

  - b, sağ yere dik üst segmenti sembolize eden bir bitlik değer

  - c, sağ yere dik alt segmenti sembolize eden bir bitlik değer

  - d, alt yere paralel segmenti sembolize eden bir bitlik değer

  - e, sol yere dik alt segmenti sembolize eden bir bitlik değer

  - f, sol yere dik üst segmenti sembolize eden bir bitlik değer

  - g, orta yere paralel segmenti sembolize eden bir bitlik değer

Amaç, çarpım sonucunda elde edilen 4 bitlik değerin 7 segmentli ekranda gösterilebilmesi için
gerekli çıkışların set edilmesini sağlayacak modülü kodlamaktır. Şekil 2’de değer ve çıkış
portları arasındaki ilişki verilmiştir.

Çözüm Adımları:
- 4x16 Decoder devresini kodlayınız.
- Her çıkış portu için,
∗ Doğruluk tablosu oluşturulacaktır.
∗ Portun set edileceği durumlar miniterimler kullanılarak fonksiyon olarak yazılacaktır.
∗ Elde edilen fonksiyondaki terimlere dair decoder çıkışlar OR operatörü ile birleştirilecektir.

## Doğruluk Tablosu
<img width="407" height="512" alt="DT" src="https://github.com/user-attachments/assets/f71717f8-7701-4ebe-8ec0-dbea09c89dcf" />

## Fonksiyon Gösterimi
<img width="345" height="347" alt="FG" src="https://github.com/user-attachments/assets/3cbc772c-ba57-4fcf-a606-ca336029d6cf" />

## Çıktı (a, b, c, d, e, f, g)
<img width="557" height="160" alt="Cikti_6" src="https://github.com/user-attachments/assets/d4984e6e-5bf1-499a-998c-7832f21c09b2" />
