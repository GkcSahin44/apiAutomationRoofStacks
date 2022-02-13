<h1>Roof Stacks Api Automation</h1>
Bu proje Roof Stacks api otomasyonunu içermektedir. 
<h2>Tool stack</h2>

* Karate DSL
* Cucumber
* IntelliJ
* Git
* Java

<h3>Proje yapısı</h3>

```
.
├── test
│   ├── data
│   │   ├── createUserRequest.json
│   │   └── getAllUserResponse.json
│   │   └── getAllUserResponseModel.json
│   ├── roofStacks
│   │   ├── allInOne.feature
│   │   ├── delete.feature
│   │   ├── get.feature
│   │   ├── patch.feature
│   │   └── patch.feature
│   ├── karate-config.js
├── readme.md
├── .gitignore
├── pom.xml
```


<h4>Config folder</h4>
Burada projeye ait configürasyonlar tutulacaktır.
<h4>Tests>RoofStacks folder</h4>
Feature filelar yani BDD formatındaki test caseler bu klasör altında yer alacaktır.
<h4>Pom XML</h4>
Projenin gerekli kütüphanelerinin yüklenilmesi için gerekli olan file.

<h2>Naming Convention</h2>

İsimlendirmeler yapılırken aşağıdaki durumlar takip edilecektir.

``variable name = myVariable``

``file name = myFile.json(etc)``

``Feature name = my_feature``

``folder name = myFolder``

``tag name = @my_tag``

<h2>Senaryo Yazımı</h2>

* Senaryolar feature file içerisine yazılacaktır.
* ``Given, When, Then, And`` Syntax i kullanılacaktır.
* Feature file başlangıcında ``Feature`` keywordunden sonra ilgili feature ın isimlendirmesi yapılacaktır.
* Bir sonraki satırda feature in açıklaması yazılacaktır.
* Senaryolar ``Scenario`` keywordunden sonra yazılacaktır. Senaryo name unique olmalıdır.
* Her senaryo taglenmelidir. İlgili tagler senaryonun üst kısmına koyulmalıdır. @positive, @negative, @load gibi.
* Senaryo stepleri yazılırken aşağıdaki örnek senaryo takip edilecektir.

```
Given ön koşul
And ek koşul varsa
When aksiyonun alındığı kısım 
And ek aksiyon varsa
Then ilgili verifikasyonların yapıldığı yer
And ek verifikasyonlar 
```

<h5>Standart Kullanım Örneği</h5>

```
Given homepage is opened

And clicks on login button

And fill the valid credentials

When clicks on login button

Then user should see my account icon

And title should changed to "My Title"

```


