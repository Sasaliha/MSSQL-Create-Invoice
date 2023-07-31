<img width="528" alt="image" src="https://github.com/Sasaliha/CreateInvoice/assets/77535648/2c933db1-8c5d-484a-8f25-aeedcbf063e1">

StoreDb'mizde admin bilgilerinin tutuldugu table ile birlikte market ürün bilgilerinin, satın alınan ürünler ile birlikte ürünlere ait sepetin, ödeme ve faturalama işlemleri ile birlikte kayıtların tutuldugu toplam 6 adet table ile çalışılmıştır.

Ürünlerin stoklara eklendiği (AddProduct) , alışveriş sepetine eklendiği (AddShoppingCarts) ve eklenen ürünlerin faturalanması ile ilgili (CompleteShopping) 3 adet procedure oluşturulmustur.


Exec AddProduct 'Şampuan', '2', 50, 80, 20 --mağazaya yeni ürün stogu ekledik
<img width="254" alt="image" src="https://github.com/Sasaliha/CreateInvoice/assets/77535648/8f73358a-0ae2-4dcb-bafa-0c405b385903">


Exec AddShoppingCarts 2, 2 --2 numaralı üründen 2 adet, 3 numaralı üründen 1 adet sepete ekledik
<img width="159" alt="image" src="https://github.com/Sasaliha/CreateInvoice/assets/77535648/340f9e81-94b9-467c-a829-832d2287c81f">

Exec CompleteShopping 'Nakit' --ödeme tipini nakit sectik ve invoiceId=15 olan yeni bir fatura ürettik ve fatura kalemlerine ait detayları listeledik.

<img width="398" alt="image" src="https://github.com/Sasaliha/CreateInvoice/assets/77535648/10244526-e124-49e3-872f-336bfefd4ccf">







