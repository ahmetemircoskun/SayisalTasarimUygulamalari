# Çalışma 5

## Soru

4x1 Mux’lar kullanarak bir kaydırıcı devre tasarlayınız.

• Girişler:
- shift, 2 bitlik kaydırma miktarı (kaç bit kaydırılacak, max 3)
- I, 8 bitlik binary vektör

• Çıkışlar:
- out, shift’e göre kaydırılmış 8 bitlik binary vektör

• Kurallar:
- İlk olarak 2x1 multiplexer modülü oluşturulmalıdır.
- 2x1 multiplexer modülünü kullanarak 4x1 multiplexer kodlanmalıdır.
- 8 bitlik sayıları verilen shift miktarına göre sola kaydırmalıdır.
- 3 kere kaydırılmalıdır.
- Kaydırma işleminde hiç bit bit atılmamalı, dışarı atılacak bit diğer yöne eklenmelidir. Örneğin sola kaydırmada, Shift(X0111010) : 0111010X olmalıdır.

## 2x1 Mux’lardan Oluşan 8 Bitlik Kaydırıcı Devre Tasarımı
<img width="584" height="666" alt="Cozum" src="https://github.com/user-attachments/assets/fa0616ce-726c-4143-b238-024d63e9339e" />

## Çıktı (01101010 ve 3 kaydırma)
<img width="609" height="186" alt="1" src="https://github.com/user-attachments/assets/aa3f61f4-b6b5-4302-baf7-9cae2fbac50a" />

## Çıktı (10010110 ve 3 kaydırma)
<img width="609" height="186" alt="2" src="https://github.com/user-attachments/assets/4b9196d4-6cf5-4151-9538-58b4cca467c6" />

## Çıktı (01010011 ve 3 kaydırma)
<img width="609" height="186" alt="3" src="https://github.com/user-attachments/assets/42d229ff-a020-4f54-b47a-065f8b2f9319" />

## Çıktı (01010011 ve 1 kaydırma - EKSTRA)
<img width="610" height="186" alt="4" src="https://github.com/user-attachments/assets/752ebc1d-5937-4079-80bf-59f7388434f9" />
