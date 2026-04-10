# Çalışma 1

## Soru

İfade: Y = AB + A’BC + BD’

(a) Verilen ifadeyi minterm ve maxterm ifadesi şeklinde ayrı ayrı genişletiniz.

(b) İfadenin maxtermleri ile genişletişmiş halini Verilog HDL ile bir modül olarak kodlayınız.

(c) İfadenin mintermleri ile genişletilmiş halini Verilog HDL ile bir modül olarak kodlayınız.

(d) Kodlanan modülleri bir test bench içerisinde çağırarak, olası tüm giriş kombinasyonları için
doğru çalıştıklarını Modelsim’de simüle ederek teyit ediniz.

## Çözüm

a) Y = AB + A'BC + BD'

Minterm:

Y = A'BC'D' + A'BCD' + A'BCD + ABC'D' + ABC'D + ABCD' + ABCD

Y = m(4,6,7,12,13,14,15)

Maxterm:

Y = (A+B+C+D)(A+B+C+D')(A+B+C'+D)(A+B+C'+D')(A+B'+C+D')(A'+B+C+D)(A'+B+C+D')(A'+B+C'+D)(A'+B+C'+D')

Y = M(0,1,2,3,5,8,9,10,11)

## Çıktı
<img width="2350" height="746" alt="image" src="https://github.com/user-attachments/assets/454e7275-119b-4063-a5e9-1cc91b1c6e00" />

