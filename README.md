Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# localbike
inspired by databird - analytics engineering bootcamp

Review dataset
categories:
category_id     1
category_name   Children Bicycles
brands:
brand id        1	
brand_name      Electra
<U customers: U>
customer_id     120
first_name      Luz
last_name       House
phone           (559) 114-2580
email           luz.house@gmail.com
street          491 Railroad Street
city            Fresno
state           CA
zip_code        93706
<U customer_items: U>
first_name      Luz
last_name       House
phone           (559) 114-2580           
email           luz.house@gmail.com
street          491 Railroad Street 
city            Fresno
state           CA
zip_code        93706
</U orders items: U>
order_id	    1325
item_id         2
product_id      257
quantity        1
list_price      899.99
discount        0.05
</U orders: U>
order_id        1
customer_id     1498
order_status    81
order_date      2018-04-06
required_date   2018-04-06
shipped_date    NULL
store_id        1
staff_id        2
</U products: U>
product_id      12
product_name    Electra Townie Original 21D - 2016
brand_id        1
category_id     3
model_year      2016
list_price      549.99
</U staffs: U>
first_name      Fabiola
last_name       Jackson
email           fabiola.jackson@bikes.shop
phone           (831) 555-5554
active          1
store_id        1
manager_id      NULL
</U stocks: U>
store_id        1
product_id      6
quantity        0
</U stores: U>
store_id        1
store_name      Santa Cruz Bikes
phone           (831) 476-4321
email           santacruz@bikes.shop
street          3700 Portola Drive
city            Santa Cruzdans
state           CA
zip_code        95060


<B 1. Définir les axes d’analyse :
○ Identifier des axes d'analyse permettant d'aider l'équipe des opérations.
○ Le but final est de leur permettre d’optimiser au mieux les ventes et de maximiser le revenu de l'entreprise grâce aux insights obtenus. B>
> identifier les produits dont les ventes sont moins fréquentes (product_id et quantity_id faible  sur order_item, order_id sur) et qui bénéficierait d'une mise en promotion,
> identifier l'effet de discoount sur amélioration des ventes
> suggérer promotions (> discount) lorsque stock stagne
> suggérer diminution discount ou hausse de prix lorsque stock disparait, seuil stock atteint (quantity of product_id, in stocks table)
> suggérer réassort, transfert de stock d'un store_id à un autre lorsque les ventes sont plus fréquentes, dans une city, un state qu'un autre

<B 2. Modélisation des données :
○ Importer les données brutes dans BigQuery. B>
24Nov done
<B ○ Structurer les données dans un projet DBT pour faciliter les analyses. B>
25Nov - staging models written
26Nov - new writing of staging models further to accidental deletion of project

<B 3. Implémentation des tests et documentation :
○ Ajouter des tests et une documentation complète, en particulier pour les modèles qui seront connectés aux tableaux de bord. B>

<B 4. Visualisation et partage :
○ Héberger le projet sur Github pour pouvoir permettre de faire une Peer-Review.
○ Créer une ou plusieurs visualisations dans l'outil de BI de votre choix (Métabase, Power BI, Tableau) pour présenter les insights de manière visuelle. B>

<B 5. Bonus: Création de dashboard et analyse
○ Effectuer une analyse complète en créant un dashboard pour répondre à la problématique d’optimisation des revenus de Local Bike B>
