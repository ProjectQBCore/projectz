var carsFilters = {
    main: [],
    hide: []
}

var cars = {}

var itemsFilters = {
    main: [],
    hide: []
}

var items = {}

var profile = {}

var money = 0
var visiblePage = ''
var switchChecked = ''

var pagesCars = 1
var pagesItems = 1
var pageNumberItems = 1
var pageNumberCars = 1

var selectedClass = ''

var config = {}

window.addEventListener('message', function (event) {
    var item = event.data;
    carsFilters = {
        main: [],
        hide: []
    }
    cars = {}
    itemsFilters = {
        main: [],
        hide: []
    }
    items = {}
    profile = {}
    money = 0
    config = {}

    if (item.showmenu) {
        config = item.config
        pagesItems = item.data.pagesItems
        pagesCars = item.data.pagesCars
        pageNumberItems = 1
        pageNumberCars = 1
        selectedClass = ''
        for (let k of config.itemsClasses) {
            if (itemsFilters.main.length < 5) {
                itemsFilters.main.push(k)
            } else {
                itemsFilters.hide.push(k)
            }
        }
        for (let k of config.carsClasses) {
            if (carsFilters.main.length < 5) {
                carsFilters.main.push(k)
            } else {
                carsFilters.hide.push(k)
            }
        }
        var c = 0
        for (let k of item.data.premiumCars) {
            cars[c] = {
                id: k.id,
                name: k.name.substring(0, 17) + ' (' + k.product_name + ')',
                plate: k.plate,
                Nprice: k.price,
                price: new Intl.NumberFormat(config.format.location, {
                    style: 'currency',
                    currency: config.format.currency
                }).format(k.price),
                classes: 'product-unit ' + k.class,
                features: k.features,
                premium: true,
                image: k.image
            }
            c++;
        }
        for (let k of item.data.normalCars) {
            cars[c] = {
                id: k.id,
                name: k.name.substring(0, 17) + ' (' + k.product_name + ')',
                plate: k.plate,
                Nprice: k.price,
                price: new Intl.NumberFormat(config.format.location, {
                    style: 'currency',
                    currency: config.format.currency
                }).format(k.price),
                classes: 'product-unit notPremium ' + k.class,
                features: k.features,
                premium: false,
                image: k.image
            }
            c++;
        }
        c = 0
        for (let k of item.data.premiumItens) {
            items[c] = {
                id: k.id,
                name: k.amount + 'x ' + k.name.substring(0, 17) + ' (' + k.product_name + ')',
                Nprice: k.price,
                price: new Intl.NumberFormat(config.format.location, {
                    style: 'currency',
                    currency: config.format.currency
                }).format(k.price),
                classes: 'product-unit ' + k.class,
                premium: true,
                image: k.image
            }
            c++;
        }
        for (let k of item.data.normalItens) {
            items[c] = {
                id: k.id,
                name: k.amount + 'x ' + k.name.substring(0, 17) + ' (' + k.product_name + ')',
                Nprice: k.price,
                price: new Intl.NumberFormat(config.format.location, {
                    style: 'currency',
                    currency: config.format.currency
                }).format(k.price),
                classes: 'product-unit notPremium ' + k.class,
                premium: false,
                image: k.image
            }
            c++;
        }

        money = item.data.userMoney

        // if (visiblePage == Lang[config.lang].vehicles_page_title) {
        //     renderCars()
        // } else 
        if (visiblePage == Lang[config.lang].items_page_title) {
            renderItens()
        } else if (visiblePage == Lang[config.lang].profile_page_title) {
            renderProfilePage()
        } else {
            visiblePage = Lang[config.lang].items_page_title
            renderItens()
        }
        document.querySelector('.price-filter-container').innerHTML = `
            <div class = 'price-filter'>
                <input id = 'filterValue2' type="number" placeholder = '${Lang[config.lang].min_value}' >
                <input id = 'filterValue' type="number" placeholder = '${Lang[config.lang].max_value}' >
                <img src="images/filter.svg" alt="" onclick = 'filterPrice()'>
            </div>
            <p class = 'restartFilters' onclick = 'restartFilters()'>${Lang[config.lang].restart_filter}</p>
        `

        document.querySelector('body').style.display = ''

        $("#withdrawimgdiv").hover(
            function () {
                $("#withdrawimg").attr("src", "images/withdraw.gif");
            },
            function () {
                $("#withdrawimg").attr("src", "images/withdraw.png");
            }
        );

        $("#s2").change(function (event) {
            if (event.currentTarget.checked) {
                switchChecked = 'checked'
                turnBlackifChecked()
            } else {
                switchChecked = ''
                document.querySelector('html > body').classList.remove('blackColor2')
                document.querySelector('.premium-title').classList.remove('blackColor2')
                document.querySelector('.postProductMain').classList.remove('blackColor')

                let buyButton = document.querySelectorAll(".buyButton");
                for (let i = 0; i < buyButton.length; i++) {
                    buyButton[i].classList.remove('fullBlack')
                    buyButton[i].classList.remove('borderSolid')
                }
                let arrowContainer = document.querySelectorAll(".arrowContainer");
                for (let i = 0; i < arrowContainer.length; i++) {
                    arrowContainer[i].classList.remove('invisible')
                }
                let filterPageUnit = document.querySelectorAll(".filterPageUnit");
                for (let i = 0; i < filterPageUnit.length; i++) {
                    filterPageUnit[i].classList.remove('invisible')
                    filterPageUnit[i].classList.remove('blackColorText')
                }
                let activeFilterPageUnit = document.querySelectorAll(".activeFilterPageUnit");
                for (let i = 0; i < activeFilterPageUnit.length; i++) {
                    activeFilterPageUnit[i].classList.remove('blackColorText')
                    activeFilterPageUnit[i].classList.remove('grey')
                }

                document.querySelector('.postProductMain').classList.remove('blackColor')
                document.querySelector('.confirmBox-container main').classList.remove('blackColor')

                let buycardh1 = document.querySelectorAll(".buycardh1");
                for (let i = 0; i < buycardh1.length; i++) {
                    buycardh1[i].classList.remove('blackColorText')
                }
                let price = document.querySelectorAll(".price");
                for (let i = 0; i < price.length; i++) {
                    price[i].classList.remove('blackColorText')
                }
                let featurep = document.querySelectorAll(".feature p");
                for (let i = 0; i < featurep.length; i++) {
                    featurep[i].classList.remove('blackColorText')
                }
                let product_unit = document.querySelectorAll(".product-unit");
                for (let i = 0; i < product_unit.length; i++) {
                    product_unit[i].classList.remove('fullBlack')
                }
                let product_name = document.querySelectorAll(".product-name");
                for (let i = 0; i < product_name.length; i++) {
                    product_name[i].classList.remove('blackColorText')
                }
            }
        });
    }
    if (item.hidemenu) {
        document.querySelector('body').style.display = 'none'
    }
});

function strip(string) {
    return string.replace(/^\s+|\s+$/g, '');
}

function renderProfilePage() {
    let pagination = document.querySelector(`#pagination-container`)
    pagination.style.display = 'none'

    let price_filter = document.querySelector(`.price-filter-container`)
    price_filter.style.display = 'none'


    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainer').style.display = 'flex'
    $.post("http://ecommerce/getProfileItens", JSON.stringify(""), function (datab) {

        let img = document.querySelector(`.mainImage`)
        img.innerHTML = `
            <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
            <img src="images/${config.profileBanner}" alt="">
        `

        var c = 0
        for (let k of datab.profileItens) {
            if (k.premium == 0) {
                profile[c] = {
                    id: k.id,
                    name: k.name,
                    Nprice: k.price,
                    price: new Intl.NumberFormat(datab.format.location, {
                        style: 'currency',
                        currency: datab.format.currency
                    }).format(k.price),
                    classes: 'product-unit notPremium ' + k.class,
                    premium: false,
                    image: k.image
                }
            } else {
                profile[c] = {
                    id: k.id,
                    name: k.name,
                    Nprice: k.price,
                    price: new Intl.NumberFormat(datab.format.location, {
                        style: 'currency',
                        currency: datab.format.currency
                    }).format(k.price),
                    classes: 'product-unit notPremium ' + k.class,
                    premium: true,
                    image: k.image
                }
            }
            c++;
        }

        let oproducts = document.querySelectorAll('.product-unit')
        for (let o in oproducts) {
            try {
                oproducts[o].remove();
            } catch (e) {
                continue
            }
        }

        let productContainer = document.querySelector('.all-product-container')
        let productElement;

        for (let i in profile) {
            try {
                var starimg = ''
                if (profile[i].premium) {
                    starimg = 'starPremium.svg'
                } else if (!profile[i].premium) {
                    starimg = 'star.svg'
                }
                productElement = `
                        <div data-id = '${i}' class = '${profile[i].classes}' data-filtered = '0'>
                            <img class="star" src="images/${starimg}" alt="">
                            <img class = 'product-img' src="${profile[i].image}" alt="">
                            <div class = 'product-text-container'>
                                <p class = 'product-name'>${profile[i].name}</p>
                                <p class = 'product-price' data-price = '${profile[i].Nprice}'>${profile[i].price}</p>
                            </div>
                            <div class = 'buyButton' onclick = 'finishSell(event)'>
                                <img src="images/close2.svg" alt="">
                            </div>
                        </div>
                    `
                productContainer.innerHTML += productElement
            } catch (e) {
                continue
            }
        }
        turnBlackifChecked()
        let products = document.querySelectorAll('.productFilter')

        for (let ab in products) {
            try {
                products[ab].remove()
            } catch (e) {
                continue
            }
        }

        let hideIcon = document.querySelector('.hiddenFilters-Icon')
        let hideContainer = document.querySelector('.hiddenFilters')
        let mainContainer = document.querySelector('.headerPart2-container')
        let premiumContainer = document.querySelector('.premium-container')

        premiumContainer.style.display = 'none'
        mainContainer.style.display = 'none'
        hideContainer.style.display = 'none'
        hideIcon.style.display = 'none'

        document.querySelector('.all').style.filter = 'blur(0px)'
        document.querySelector('.loadingContainer').style.display = 'none'
    });
}

function renderProductsFilter(obj, filters, pagination_list, pagination_number, type) {
    let price_filter = document.querySelector(`.price-filter-container`)
    price_filter.style.display = ''

    let pagination = document.querySelector(`#pagination`)
    pagination.innerHTML = ``
    var activeFilterPageUnit = ``
    for (var i = 1; i <= pagination_list; i++) {
        activeFilterPageUnit = ``
        if (i == pagination_number) {
            activeFilterPageUnit = `activeFilterPageUnit`
        }
        pagination.innerHTML += `<p onclick = 'changeSectionFilter(event,${type})' class = 'filterPageUnit ${activeFilterPageUnit}'>${i}</p>`
    }

    let pagination_container = document.querySelector(`#pagination-container`)
    pagination_container.style.display = 'flex'

    let oproducts = document.querySelectorAll('.product-unit')
    for (let o in oproducts) {
        try {
            oproducts[o].remove();
        } catch (e) {
            continue
        }
    }


    let premiumContainer = document.querySelector('.premium-container')

    premiumContainer.style.display = ''

    let premiumProductContainer = document.querySelector('.premium-product-container')
    let productContainer = document.querySelector('.all-product-container')
    let productElement;

    for (let i in obj) {
        try {
            if (obj[i].premium) {
                productElement = `
                    <div data-id = '${i}' class = '${obj[i].classes}' data-filtered = '0'>
                        <img class="star" src="images/starPremium.svg" alt="">
                        <img class = 'product-img' src="${obj[i].image}" alt="">
                        <div class = 'product-text-container'>
                            <p class = 'product-name'>${obj[i].name}</p>
                            <p class = 'product-price' data-price = '${obj[i].Nprice}'>${obj[i].price}</p>
                        </div>
                        <div class = 'buyButton' onclick = 'finishBuy(event)'>
                            <img src="images/shopping-cart.svg" alt="">
                        </div>
                    </div>
                `
                premiumProductContainer.innerHTML += productElement
            } else if (!obj[i].premium) {
                productElement = `
                    <div data-id = '${i}' class = '${obj[i].classes}' data-filtered = '0'>
                        <img class="star" src="images/star.svg" alt="">
                        <img class = 'product-img' src="${obj[i].image}" alt="">
                        <div class = 'product-text-container'>
                            <p class = 'product-name'>${obj[i].name}</p>
                            <p class = 'product-price' data-price = '${obj[i].Nprice}'>${obj[i].price}</p>
                        </div>
                        <div class = 'buyButton' onclick = 'finishBuy(event)'>
                            <img src="images/shopping-cart.svg" alt="">
                        </div>
                    </div>
                `
                productContainer.innerHTML += productElement
            }
        } catch (e) {
            continue
        }
    }
    turnBlackifChecked()
    let products = document.querySelectorAll('.productFilter')

    for (let ab in products) {
        try {
            products[ab].remove()
        } catch (e) {
            continue
        }
    }

    let hideIcon = document.querySelector('.hiddenFilters-Icon')
    let hideContainer = document.querySelector('.hiddenFilters')
    let mainContainer = document.querySelector('.headerPart2-container')


    for (let b in filters.main) {
        try {
            if (filters.main[b] == selectedClass) {
                mainContainer.innerHTML += `<p class = 'productFilter activeProduct hidep' onclick = 'changeFilter(event)'>${filters.main[b]}</p>`
            } else {
                mainContainer.innerHTML += `<p class = 'productFilter hidep' onclick = 'changeFilter(event)'>${filters.main[b]}</p>`
            }
        } catch (e) {
            continue
        }
    }

    mainContainer.style.display = 'flex'
    if (filters.hide.length <= 0) {
        hideContainer.style.display = 'none'
        hideIcon.style.display = 'none'
    } else if (filters.hide.length > 0) {
        hideIcon.style.display = 'flex'
    }

    for (let a in filters.hide) {
        try {
            if (filters.hide[a] == selectedClass) {
                hideContainer.innerHTML += `<p class = 'productFilter activeProduct hidep' onclick = 'changeFilter(event)'>${filters.hide[a]}</p>`
            } else {
                hideContainer.innerHTML += `<p class = 'productFilter hidep' onclick = 'changeFilter(event)'>${filters.hide[a]}</p>`
            }
        } catch (e) {
            continue
        }
    }
}

function renderCars() {
    let main_filter = document.querySelector(`.headerPart1-container`)
    main_filter.innerHTML = `
        <div class="mainFilter">
            <p id='mp2' class = 'mainFilterp' onclick="changeProductFilter(event)">${Lang[config.lang].items_page_title}</p>
            <p id='mp3' class = 'mainFilterp' onclick="changeProductFilter(event)">${Lang[config.lang].profile_page_title}</p>
        </div>
        <div class = 'searchFilter' >
            <input id = 'searchValue'  type="text" placeholder="${Lang[config.lang].search_box}">
            <img onclick = 'nameFilter()' src="images/search.svg" alt="" />
        </div>
        <div id="withdrawimgdiv" class = 'moneyStatus-container' onClick="withdrawMoney()">
            <main>
                <img id="withdrawimg" src="images/withdraw.png" alt="" onclick = 'getMoney()' >
                <p>${new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency}).format(money)}</p>
            </main>
        </div>
        <input id="s2" type="checkbox" class="switch" ${switchChecked}>
    `
    let premium_title = document.querySelector(`.premium-title`)
    premium_title.innerHTML = `
        <img src="images/crown.svg" alt="">
        <p class = 'premiumText'>${Lang[config.lang].premium_vehicles}</p>
    `
    let img = document.querySelector(`.mainImage`)
    img.innerHTML = `
        <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
        <img src="images/${config.carBanner}" alt="">
    `
    renderProductsFilter(cars, carsFilters, pagesCars, pageNumberCars, 0)
}

function renderItens() {
    let main_filter = document.querySelector(`.headerPart1-container`)
    main_filter.innerHTML = `
        <div class="mainFilter">
            <p id='mp2' class = 'mainFilterp mainFilterActive' onclick="changeProductFilter(event)">${Lang[config.lang].items_page_title}</p>
            <p id='mp3' class = 'mainFilterp' onclick="changeProductFilter(event)">${Lang[config.lang].profile_page_title}</p>
        </div>
        <div class = 'searchFilter' >
            <input id = 'searchValue'  type="text" placeholder="${Lang[config.lang].search_box}">
            <img onclick = 'nameFilter()' src="images/search.svg" alt="" />
        </div>
        <div id="withdrawimgdiv" class = 'moneyStatus-container' onClick="withdrawMoney()">
            <main>
                <img id="withdrawimg" src="images/withdraw.png" alt="" onclick = 'getMoney()' >
                <p>${new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency}).format(money)}</p>
            </main>
        </div>
        <input id="s2" type="checkbox" class="switch" ${switchChecked}>
    `
    let premium_title = document.querySelector(`.premium-title`)
    premium_title.innerHTML = `
        <img src="images/crown.svg" alt="">
        <p class = 'premiumText'>${Lang[config.lang].premium_items}</p>
    `
    let img = document.querySelector(`.mainImage`)
    img.innerHTML = `
        <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
        <img src="images/${config.itemsBanner}" alt="">
    `
    renderProductsFilter(items, itemsFilters, pagesItems, pageNumberItems, 1)
}

function changeFilter(event) {
    document.querySelector('.headerPart2-container').dataset.already = '1'

    let element = event.currentTarget


    let filters = document.querySelectorAll(`.productFilter`)

    for (let b in filters) {
        try {
            filters[b].classList.remove('activeProduct')
            filters[b].classList.remove('fade')
        } catch (e) {
            continue
        }
    }

    element.classList.add('activeProduct')
    element.classList.add('fade')

    let maxPrice = document.querySelector('#filterValue').value
    let minPrice = document.querySelector('#filterValue2').value
    let searchValue = strip(document.getElementById('searchValue').value)

    var type = 1
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     type = 0
    // } else 
    if (visiblePage == Lang[config.lang].items_page_title) {
        type = 1
    }
    selectedClass = element.textContent

    getEcommercePageData(searchValue, type, 1, maxPrice, minPrice, selectedClass)
    window.scroll(0, 700)
}

function filterPrice() {
    let maxPrice = document.querySelector('#filterValue').value
    let minPrice = document.querySelector('#filterValue2').value
    let searchValue = strip(document.getElementById('searchValue').value)

    var type = 1
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     type = 0
    // } else
    if (visiblePage == Lang[config.lang].items_page_title) {
        type = 1
    }

    getEcommercePageData(searchValue, type, 1, maxPrice, minPrice, selectedClass)
}

function restartFilters() {
    selectedClass = ''
    let all = document.querySelectorAll('.notPremium')
    document.querySelector('.headerPart2-container').dataset.already = '0'
    for (let i in all) {
        try {
            all[i].style.display = 'flex'
            all[i].dataset.filtered = '0'
        } catch (e) {
            continue
        }
    }

    let filters = document.querySelectorAll(`.productFilter`)

    for (let b in filters) {
        try {
            filters[b].classList.remove('activeProduct')
            filters[b].classList.remove('fade')
        } catch (e) {
            continue
        }
    }

    var type = 1
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     type = 0
    // } else 
    if (visiblePage == Lang[config.lang].items_page_title) {
        type = 1
    }
    document.querySelector('#filterValue').value = ''
    document.querySelector('#filterValue2').value = ''
    document.getElementById('searchValue').value = ''
    getEcommercePageData("", type, 1, 0, 0, '')
}

function hiddenFilters(event) {
    let bttn = event.currentTarget
    let bttnStatus = bttn.dataset.open
    let hiddenFilters = document.querySelector('.hiddenFilters')

    if (bttnStatus == '0') {
        bttn.src = 'images/up-arrow.svg'
        bttn.dataset.open = '1'
        hiddenFilters.style.display = 'flex'

        hiddenFilters.classList.remove('height1')
        hiddenFilters.classList.add('fade')
        hiddenFilters.classList.add('height')

    } else if (bttnStatus == '1') {
        bttn.src = 'images/down-arrow.svg'
        bttn.dataset.open = '0'

        hiddenFilters.classList.remove('height')
        hiddenFilters.classList.add('height1')

        setTimeout(() => {

            hiddenFilters.style.display = 'none'
        }, 580)
    }


}

function alertBox(text, color, image) {
    let box = document.querySelector('.alertBox')
    let boxText = document.querySelector('.alertText')
    let img = document.querySelector('.alertImg')

    boxText.textContent = text

    img.src = image
    box.style.backgroundColor = color

    box.style.display = 'flex'
    box.classList.remove('right')
    box.classList.add('left')

    setTimeout(() => {

        box.classList.remove('left')
        box.classList.add('right')

        setTimeout(() => {
            box.style.display = 'none'
        }, 580)

    }, 2000)

}


function nameFilter() {
    let searchValue = strip(document.getElementById('searchValue').value)
    if (visiblePage == Lang[config.lang].profile_page_title) {

        let products = document.querySelectorAll('.notPremium')
        let name;
        var alert = false
        for (let i in products) {
            try {
                name = products[i].childNodes[5].childNodes[1].textContent

                if (name.length >= searchValue.length) {

                    if ((name.slice(0, searchValue.length)).toUpperCase() == searchValue.toUpperCase()) {
                        products[i].style.display = 'flex'
                        alert = true
                    } else if ((name.slice(0, searchValue.length)).toUpperCase() != searchValue.toUpperCase()) {
                        products[i].style.display = 'none'
                    }
                } else {
                    products[i].style.display = 'none'
                }

            } catch (e) {
                continue
            }

        }
        if (alert) {
            window.scroll(0, 700)
        } else if (!alert) {
            alertBox(Lang[config.lang].notify_not_found, 'rgb(251, 99, 99)', 'images/close.svg')
        }

    } else {
        var type = 1
        // if (visiblePage == Lang[config.lang].vehicles_page_title) {
        //     type = 0
        // } else 
        if (visiblePage == Lang[config.lang].items_page_title) {
            type = 1
        }

        let maxPrice = document.querySelector('#filterValue').value
        let minPrice = document.querySelector('#filterValue2').value
        getEcommercePageData(searchValue, type, 1, maxPrice, minPrice, selectedClass)
        window.scroll(0, 700)
    }
}

function getEcommercePageData(searchValue, type, page, maxPrice, minPrice, productclass) {
    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainer').style.display = 'flex'
    $.post("http://ecommerce/getEcommercePageData", JSON.stringify({
        search: searchValue,
        type: type,
        page: page,
        maxPrice: maxPrice,
        minPrice: minPrice,
        productclass: productclass
    }), function (datab) {
        if (datab) {
            var c = 0
            if (type == 0) {
                pageNumberCars = page
                cars = {}
                for (let k of datab.premiumCars) {
                    cars[c] = {
                        id: k.id,
                        plate: k.plate,
                        name: k.name.substring(0, 17) + ' (' + k.product_name + ')',
                        Nprice: k.price,
                        price: new Intl.NumberFormat(config.format.location, {
                            style: 'currency',
                            currency: config.format.currency
                        }).format(k.price),
                        classes: 'product-unit ' + k.class,
                        features: k.features,
                        premium: true,
                        image: k.image
                    }
                    c++;
                }
                for (let k of datab.normalCars) {
                    cars[c] = {
                        id: k.id,
                        plate: k.plate,
                        name: k.name.substring(0, 17) + ' (' + k.product_name + ')',
                        Nprice: k.price,
                        price: new Intl.NumberFormat(config.format.location, {
                            style: 'currency',
                            currency: config.format.currency
                        }).format(k.price),
                        classes: 'product-unit notPremium ' + k.class,
                        features: k.features,
                        premium: false,
                        image: k.image
                    }
                    c++;
                }
                pagesCars = datab.pagesCars
                renderProductsFilter(cars, carsFilters, pagesCars, pageNumberCars, 0)
            } else {
                pageNumberItems = page
                items = {}
                c = 0
                for (let k of datab.premiumItens) {
                    items[c] = {
                        id: k.id,
                        name: k.amount + 'x ' + k.name.substring(0, 17) + ' (' + k.product_name + ')',
                        Nprice: k.price,
                        price: new Intl.NumberFormat(config.format.location, {
                            style: 'currency',
                            currency: config.format.currency
                        }).format(k.price),
                        classes: 'product-unit ' + k.class,
                        premium: true,
                        image: k.image
                    }
                    c++;
                }
                for (let k of datab.normalItens) {
                    items[c] = {
                        id: k.id,
                        name: k.amount + 'x ' + k.name.substring(0, 17) + ' (' + k.product_name + ')',
                        Nprice: k.price,
                        price: new Intl.NumberFormat(config.format.location, {
                            style: 'currency',
                            currency: config.format.currency
                        }).format(k.price),
                        classes: 'product-unit notPremium ' + k.class,
                        premium: false,
                        image: k.image
                    }
                    c++;
                }
                pagesItems = datab.pagesItems
                renderProductsFilter(items, itemsFilters, pagesItems, pageNumberItems, 1)
            }
        }
        document.querySelector('.all').style.filter = 'blur(0px)'
        document.querySelector('.loadingContainer').style.display = 'none'
    });
}

function changeProductFilter(event) {
    let element = event.currentTarget
    let img = document.querySelector(`.mainImage`)
    let text = document.querySelector('.premiumText')
    visiblePage = element.textContent
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     restartFilters()
    //     text.textContent = Lang[config.lang].premium_vehicles
    //     img.innerHTML = `
    //         <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
    //         <img src="images/${config.carBanner}" alt="">
    //     `

    //     renderProductsFilter(cars, carsFilters, pagesCars, pageNumberCars, 0)
    // } else 
    if (visiblePage == Lang[config.lang].items_page_title) {
        restartFilters()
        text.textContent = Lang[config.lang].premium_items
        img.innerHTML = `
            <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
            <img src="images/${config.itemsBanner}" alt="">
        `

        renderProductsFilter(items, itemsFilters, pagesItems, pageNumberItems, 1)
    } else {
        img.innerHTML = `
            <button onclick="openPost()">${Lang[config.lang].announce_button}</button>
            <img src="images/${config.profileBanner}" alt="">
        `
        renderProfilePage()
    }
    let filters = document.querySelectorAll(`.mainFilterp`)

    for (let b in filters) {
        try {
            filters[b].classList.remove('mainFilterActive')
            filters[b].classList.remove('fade')
        } catch (e) {
            continue
        }
    }

    element.classList.add('mainFilterActive')
    element.classList.add('fade')

    let all = document.querySelector('.all')
    all.classList.add('fade')

    setTimeout(() => {
        all.classList.remove('fade')
    }, 590)

    document.querySelector('.filterStatus').innerHTML = element.textContent
}

function finishBuy(event) {
    let id = event.currentTarget.parentNode.dataset.id

    let box = document.querySelector('.confirmBox-container')
    let boxMain = document.querySelector('.confirmBox-container main')

    let status = document.querySelector('.filterStatus')

    let all = document.querySelector('.all')

    box.classList.remove('hide')
    box.style.display = 'flex'
    box.classList.add('fade')
    all.style.filter = 'blur(1px)'


    // if (status.textContent == Lang[config.lang].vehicles_page_title) {
    //     boxMain.innerHTML = `
    //         <img onclick = 'closeBox()' class = 'close-box'  src="images/close2.svg" alt="">
    //         <img src="${cars[id].image}" alt="">
    //         <div class = 'vertLine'></div>
    //         <h1 class='buycardh1'>${cars[id].name}</h1>
    //         <p class = 'price'>${cars[id].price}</p>
    //         <div class = 'features-container'>
    //             <div class = 'feature'>
    //                 <img src="images/plate.svg" alt="">
    //                 <p><strong>${Lang[config.lang].plate}</strong> ${cars[id].plate}</p>
    //             </div>
    //             <div class = 'feature'>
    //                 <img src="images/color.svg" alt="">
    //                 <p><strong>${Lang[config.lang].color}</strong> ${cars[id].features.split('|')[0]}</p>
    //             </div>
    //             <div class = 'feature'>
    //                 <img src="images/gear.svg" alt="" >
    //                 <p><strong>${Lang[config.lang].details}</strong> ${cars[id].features.split('|')[1]}</p>
    //             </div>
    //         </div>
    //         <button class='confirmBuyButton' onclick = 'checkMoney()'>${Lang[config.lang].button_finish_buy}</button>
    //     `

    // } else

    boxMain.innerHTML = `
        <img onclick = 'closeBox()' class = 'close-box'  src="images/close2.svg" alt="">
        <img src="${items[id].image}" alt="">
        <div class='buycardh1' class = 'vertLine'></div>
        <h1>${items[id].name}</h1>
        <p class = 'price'>${items[id].price}</p>
        <button class='confirmBuyButton' onclick = 'checkMoney()'>${Lang[config.lang].button_finish_buy}</button>
    `
    turnBlackifChecked()
    box.dataset.id = id

}

function finishSell(event) {
    let id = event.currentTarget.parentNode.dataset.id

    let box = document.querySelector('.confirmBox-container')
    let boxMain = document.querySelector('.confirmBox-container main')

    let all = document.querySelector('.all')

    box.classList.remove('hide')
    box.style.display = 'flex'
    box.classList.add('fade')
    all.style.filter = 'blur(1px)'

    boxMain.innerHTML = `
        <img onclick = 'closeBox()' class = 'close-box'  src="images/close2.svg" alt="">
        <img src="${profile[id].image}" alt="">
        <div class = 'vertLine'></div>
        <h1 class='buycardh1'>${profile[id].name}</h1>
        <p class = 'price'>${profile[id].price}</p>
        <button class='confirmSellButton' onclick = 'deleteItem()'>${Lang[config.lang].button_remove_announce}</button>
    `
    turnBlackifChecked()
    box.dataset.id = id
}

function closeBox() {
    let box = document.querySelector('.confirmBox-container')


    let all = document.querySelector('.all')

    box.classList.remove('fade')
    box.classList.add('hide')
    all.style.filter = 'blur(0px)'

    setTimeout(() => {
        box.style.display = 'none'
    }, 580)
}

function withdrawMoney() {
    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainer').style.display = 'flex'
    $.post("http://ecommerce/withdrawMoney", JSON.stringify(""), function (datab) {
        if (datab > 0) {
            let main_filter = document.querySelector(`.moneyStatus-container`)
            main_filter.innerHTML = `
                    <main>
                        <img id="withdrawimg" src="images/withdraw.png" alt="" onclick = 'getMoney()' >
                        <p>${new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency}).format(0)}</p>
                    </main>
                `
            alertBox(Lang[config.lang].notify_moneywithdraw.format(new Intl.NumberFormat(config.format.location, {
                style: 'currency',
                currency: config.format.currency
            }).format(datab)), 'rgb(54, 233, 158)', 'images/check.svg')
        }

        document.querySelector('.all').style.filter = 'blur(0px)'
        document.querySelector('.loadingContainer').style.display = 'none'
    });
}

function deleteItem() {
    closeBox()

    let box = document.querySelector('.confirmBox-container')
    let id = box.dataset.id

    $.post("http://ecommerce/deleteItem", JSON.stringify(profile[id]), function (datab) {
        if (datab === true) {
            alertBox(Lang[config.lang].notify_success_removed, 'rgb(54, 233, 158)', 'images/check.svg')
        } else if (datab === 1) {
            alertBox(Lang[config.lang].notify_error_product, 'rgb(251, 99, 99)', 'images/close.svg')
        }

    });
}

function checkMoney() {
    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainerConfirmBox').style.display = 'flex'

    let box = document.querySelector('.confirmBox-container')
    let id = box.dataset.id
    let status = document.querySelector('.filterStatus')

    var obj
    // if (status.textContent == Lang[config.lang].vehicles_page_title) {
    //     obj = cars[id]
    // } else 

    obj = items[id]

    $.post("http://ecommerce/buyItem", JSON.stringify(obj), function (datab) {
        if (datab === true) {
            alertBox(Lang[config.lang].notify_success_buy, 'rgb(54, 233, 158)', 'images/check.svg')
            closeBox()
        } else if (datab === 1) {
            alertBox(Lang[config.lang].notify_insufficient_money_buy, 'rgb(251, 99, 99)', 'images/close.svg')
        } else if (datab === 2) {
            alertBox(Lang[config.lang].notify_error_product, 'rgb(251, 99, 99)', 'images/close.svg')
        } else if (datab === 3) {
            alertBox(Lang[config.lang].notify_cant_carry, 'rgb(251, 99, 99)', 'images/close.svg')
        }

        document.querySelector('.all').style.filter = 'blur(0px)'
        document.querySelector('.loadingContainerConfirmBox').style.display = 'none'
    });
}

function changeProductType(event) {
    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainer').style.display = 'flex'

    let element = event.currentTarget;
    let select = document.querySelector('#classes')
    let selectProducts = document.querySelector('#products-list')

    // if (element.textContent == Lang[config.lang].vehicles_page_title) {
    //     $.post("http://ecommerce/getVehicles", JSON.stringify(""), function (datab) {
    //         if (datab) {
    //             select.innerHTML = getClassOptionHtml(carsFilters)
    //             document.querySelector('.features-containerM').style.display = 'flex'
    //             var item_container = document.querySelector('.input-container')
    //             if(item_container){
    //                 item_container.style.display = 'flex'
    //             }
    //             let details = document.querySelector(`.details-containerM`)
    //             details.innerHTML = `
    //                 <input class='postProductInput' id = 'int-name'  type="text" placeholder="${Lang[config.lang].input_product_name}">
    //                 <input class='postProductInput' id = 'int-value' type="number" placeholder="${Lang[config.lang].input_product_value}">
    //             `
    //             document.querySelector('.features-containerM').classList.add('fade')
    //             selectProducts.innerHTML = getVehiclesOptionHtml(datab)
    //             changeActiveProductClassSelector(element)
    //         }

    //         document.querySelector('.all').style.filter = 'blur(0px)'
    //         document.querySelector('.loadingContainer').style.display = 'none'
    //     });
    // } else 
    if (element.textContent == Lang[config.lang].items_page_title) {

        $.post("http://ecommerce/getItens", JSON.stringify(""), function (datab) {
            if (datab) {
                select.innerHTML = getClassOptionHtml(itemsFilters)
                document.querySelector('.features-containerM').style.display = 'none'
                var item_container = document.querySelector('.input-container')
                if (item_container) {
                    item_container.style.display = 'none'
                }
                let details = document.querySelector(`.details-containerM`)
                details.innerHTML = `
                    <input class='postProductInput' id = 'int-name'  type="text" placeholder="${Lang[config.lang].input_product_name}">
                    <input class='postProductInput' id = 'int-value' type="number" placeholder="${Lang[config.lang].input_product_value}">
                    <input class='postProductInput' id = 'int-amount' type="number" placeholder="${Lang[config.lang].input_product_amount}">
                `
                document.querySelector('.features-containerM').classList.remove('fade')
                selectProducts.innerHTML = getItensOptionHtml(datab)
                changeActiveProductClassSelector(element)
            }
            document.querySelector('.all').style.filter = 'blur(0px)'
            document.querySelector('.loadingContainer').style.display = 'none'
        });
    }
}

function changeActiveProductClassSelector(element) {
    let cois = document.querySelectorAll('.coi')

    for (let i in cois) {
        try {
            cois[i].classList.remove('fade')
            cois[i].classList.remove('activeProductM')

        } catch (e) {
            continue
        }
    }

    element.classList.add('activeProductM')
    element.classList.add('fade')
}

async function postProduct() {
    let premium = document.querySelector('#premiumConf').checked
    let name = strip(document.querySelector('#int-name').value)
    let value = strip(document.querySelector('#int-value').value)


    var select = document.getElementById('classes');
    var classe = select.options[select.selectedIndex].text;

    var selectProduct = document.getElementById('products-list');
    var product = selectProduct.options[selectProduct.selectedIndex].value;
    var plate = selectProduct.options[selectProduct.selectedIndex].getAttribute('plate');

    let file = document.querySelector('#img-input')
    let amount = 0;
    if (name != '' && value != '' && select.selectedIndex > 0 && selectProduct.selectedIndex > 0) {

        // if (type == Lang[config.lang].vehicles_page_title) {
        //     var color = strip(document.querySelector('.colorInt').value)
        //     var tune = strip(document.querySelector('.tuneInt').value)

        //     if (color == '' || tune == '' || file.value == '') {
        //         alertBox(Lang[config.lang].notify_invalid_fields, 'rgb(251, 99, 99)', 'images/close.svg')
        //         return
        //     }
        // } else {
        amount = strip(document.querySelector('#int-amount').value)
        if (amount != '') {
            amount = parseInt(amount)
            if (amount <= 0) {
                alertBox(Lang[config.lang].notify_invalid_value, 'rgb(251, 99, 99)', 'images/close.svg')
                return
            }
        } else {
            alertBox(Lang[config.lang].notify_invalid_fields, 'rgb(251, 99, 99)', 'images/close.svg')
            return
        }
        // }
        value = parseInt(value)
        if (value <= 0) {
            alertBox(Lang[config.lang].notify_invalid_value, 'rgb(251, 99, 99)', 'images/close.svg')
            return
        }
    } else {
        alertBox(Lang[config.lang].notify_invalid_fields, 'rgb(251, 99, 99)', 'images/close.svg')
        return
    }


    var imageLink
    // if (config.useImgurAPI == true) {
    //     let all = document.querySelector('.postProduct-container main')
    //     all.innerHTML = `
    //         <img class = 'loadingGif' src = 'images/loading.gif'></img>
    //     `

    //     all.style.justifyContent = 'center'

    //     if (type == Lang[config.lang].vehicles_page_title) {

    //         var myHeaders = new Headers();
    //         myHeaders.append("Authorization", "Client-ID "+config.imgurClientId);

    //         var formdata = new FormData();
    //         formdata.append("image",  file.files[0]);

    //         var requestOptions = {
    //             method: 'POST',
    //             headers: myHeaders,
    //             body: formdata,
    //             redirect: 'follow'
    //         };

    //         var url = JSON.parse(await (await fetch("https://api.imgur.com/3/image", requestOptions)).text())

    //         if (url.data.link == ''  || url.data.link == undefined ) {
    //             alertBox(Lang[config.lang].notify_upload_error, 'rgb(251, 99, 99)', 'images/close.svg')
    //             closePost()
    //             return 
    //         } else {
    //             imageLink = url.data.link
    //         }
    //     }
    // }

    var obj;
    obj = {
        product_id: product,
        name: name,
        type: 1,
        price: value,
        amount: amount,
        class: classe,
        premium: premium
    }


    $.post("http://ecommerce/insertItem", JSON.stringify(obj), function (datab) {
        if (datab === true) {
            alertBox(Lang[config.lang].notify_created, 'rgb(54, 233, 158)', 'images/check.svg')
        } else if (datab === 1) {
            alertBox(Lang[config.lang].notify_insufficient_money_premium, 'rgb(251, 99, 99)', 'images/close.svg')
        } else if (datab === 2) {
            alertBox(Lang[config.lang].notify_no_item, 'rgb(251, 99, 99)', 'images/close.svg')
        } else if (datab === 3) {
            alertBox(Lang[config.lang].notify_blacklisted_item, 'rgb(251, 99, 99)', 'images/close.svg')
        } else if (datab === 4) {
            alertBox(Lang[config.lang].notify_invalid_value, 'rgb(251, 99, 99)', 'images/close.svg')
        }
        closePost()
    });
}

function closePost() {
    let all = document.querySelector('.postProduct-container')
    all.classList.add('hide')

    setTimeout(function () {
        all.style.display = 'none'
        all.classList.remove('hide')
    }, 580)

    let all1 = document.querySelector('.all')

    all1.style.filter = 'blur(0px)'
}

function checkURL(url) {
    return (url.match(/\.(jpeg|jpg|gif|png)$/) != null);
}

function validURL(str) {
    var pattern = new RegExp('^(https?:\\/\\/)?' + // protocol
        '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + // domain name
        '((\\d{1,3}\\.){3}\\d{1,3}))' + // OR ip (v4) address
        '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
        '(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
        '(\\#[-a-z\\d_]*)?$', 'i'); // fragment locator
    return !!pattern.test(str);
}

function openPost() {
    document.querySelector('.all').style.filter = 'blur(10px)'
    document.querySelector('.loadingContainer').style.display = 'flex'

    $.post("http://ecommerce/getItens", JSON.stringify(""), function (datab) {
        if (datab) {
            let all = document.querySelector('.postProduct-container')
            all.style.display = 'flex'
            all.classList.remove('hide')
            all.classList.add('fade')

            let main = document.querySelector('.postProductMain')
            main.innerHTML = `
                    <img class = 'close-box'  src="images/close2.svg" alt="" onclick = "closePost()">

                    <div class = 'coi-container'>
                        <button class = 'itemCoi coi' onclick = 'changeProductType(event)' type="text">${Lang[config.lang].items_page_title}</button>
                    </div>

                    <select class = 'select-class' id = 'products-list'>
                        ` + getItensOptionHtml(datab) + `
                    </select>

                    <div class = 'details-containerM'>
                    <input class='postProductInput' id = 'int-name'  type="text" placeholder="${Lang[config.lang].input_product_name}">
                    <input class='postProductInput' id = 'int-value' type="number" placeholder="${Lang[config.lang].input_product_value}">
                    <input class='postProductInput' id = 'int-amount' type="number" placeholder="${Lang[config.lang].input_product_amount}">
                    </div>
                    <select class = 'select-class' id = 'classes'>
                        ` + getClassOptionHtml(itemsFilters) + `
                    </select>

                    <div class = 'features-containerM'>
                        <div class = 'featureM'>
                            <img src="images/color.svg" alt="" >
                            <input class = 'postProductInput colorInt' type="text" placeholder="${Lang[config.lang].input_product_color}">
                        </div>
                        <div class = 'featureM'>
                            <img src="images/gear.svg" alt="">
                            <input class = 'postProductInput tuneInt' type="text" placeholder="${Lang[config.lang].input_product_details}">
                        </div>
                    </div>
                    <div class = 'inputPremium'>
                        <input type="checkbox" name="premium" id="premiumConf">
                        <label for="premiumConf">${Lang[config.lang].checkbox_product_premium}</label>
                    </div>
                    <button onclick = 'postProduct()' class = 'sellProdBttn' >${Lang[config.lang].button_sell}</button>
            `

            let all1 = document.querySelector('.all')
            all1.style.filter = 'blur(1px)'
            document.querySelector('.features-containerM').style.display = 'none'
            var item_container = document.querySelector('.input-container')
            if (item_container) {
                item_container.style.display = 'none'
            }
            document.querySelector('.features-containerM').classList.remove('fade')
            let selectProducts = document.querySelector('#products-list')
            selectProducts.innerHTML = getItensOptionHtml(datab)
        }

        document.querySelector('.all').style.filter = 'blur(0px)'
        document.querySelector('.loadingContainer').style.display = 'none'
    });
}

function getVehiclesOptionHtml(filters) {
    var optionhtml = `<option selected value="">${Lang[config.lang].your_vehicles}</option>`

    for (let k in filters) {
        try {
            optionhtml += `<option class = 'classOp' plate='${filters[k].plate}' value='${filters[k].vehicle}'>${filters[k].vehName}</option>`
        } catch (e) {
            continue
        }
    }
    return optionhtml
}

function getItensOptionHtml(filters) {
    var optionhtml = `<option selected value="">${Lang[config.lang].your_items}</option>`

    for (let k in filters) {
        try {
            optionhtml += `<option class = 'classOp' value='${filters[k].item}'>${filters[k].itemName}</option>`
        } catch (e) {
            continue
        }
    }
    return optionhtml
}

function getClassOptionHtml(filters) {
    var optionhtml = `<option selected value="">${Lang[config.lang].product_class}</option>`

    for (let k in filters.main) {
        try {
            optionhtml += `<option class = 'classOp'>${filters.main[k]}</option>`
        } catch (e) {
            continue
        }
    }

    for (let k in filters.hide) {
        try {
            optionhtml += `<option class = 'classOp'>${filters.hide[k]}</option>`
        } catch (e) {
            continue
        }
    }
    return optionhtml
}

function getUploadImgHml() {
    var imgHtml = ''
    if (config.useImgurAPI == true) {
        imgHtml = `
            <div class="input-container">
                <p>${Lang[config.lang].input_product_photo}</p>
                <div class="upload-bttn">
                    <img src="images/upload.svg" alt=""> 
                </div> 
                <input id = 'img-input' class = 'img-input' type="file" accept="image/png, image/jpeg">
            </div>
        `
    } else {
        imgHtml = `<input id = 'img-input'  type="text" placeholder="${Lang[config.lang].input_product_photo}">`
    }
    return imgHtml
}

function proxSection() {
    var type = 1
    var page = 0
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     type = 0
    //     page = pageNumberCars
    //     if ((page + 1) <= pagesCars) {
    //         page = page + 1
    //     }
    // } else 
    if (visiblePage == Lang[config.lang].items_page_title) {
        type = 1
        page = pageNumberItems
        if ((page + 1) <= pagesItems) {
            page = page + 1
        }
    }

    let searchValue = strip(document.getElementById('searchValue').value)
    let maxPrice = document.querySelector('#filterValue').value
    let minPrice = document.querySelector('#filterValue2').value

    getEcommercePageData(searchValue, type, page, maxPrice, minPrice, selectedClass)
}

function voltSection() {
    var type = 1
    var page = 0
    // if (visiblePage == Lang[config.lang].vehicles_page_title) {
    //     type = 0
    //     page = pageNumberCars
    //     if ((page - 1) >= 1) {
    //         page = page - 1
    //     }
    // } else 
    if (visiblePage == Lang[config.lang].items_page_title) {
        type = 1
        page = pageNumberItems
        if ((page - 1) >= 1) {
            page = page - 1
        }
    }

    let searchValue = strip(document.getElementById('searchValue').value)
    let maxPrice = document.querySelector('#filterValue').value
    let minPrice = document.querySelector('#filterValue2').value

    getEcommercePageData(searchValue, type, page, maxPrice, minPrice, selectedClass)
}

async function changeSectionFilter(event, type) {
    let old = document.querySelector('.activeFilterPageUnit')

    if (old != null) {
        old.classList.remove('activeFilterPageUnit')
    }

    let element = event.currentTarget

    let searchValue = strip(document.getElementById('searchValue').value)
    let maxPrice = document.querySelector('#filterValue').value
    let minPrice = document.querySelector('#filterValue2').value
    getEcommercePageData(searchValue, type, element.innerHTML, maxPrice, minPrice, selectedClass)

    element.classList.add('activeFilterPageUnit')
}

function turnBlackifChecked() {
    if (switchChecked == 'checked') {
        document.querySelector('html > body').classList.add('blackColor2')
        document.querySelector('.premium-title').classList.add('blackColor2')
        document.querySelector('.postProductMain').classList.add('blackColor')

        let buyButton = document.querySelectorAll(".buyButton");
        for (let i = 0; i < buyButton.length; i++) {
            buyButton[i].classList.add('fullBlack')
            buyButton[i].classList.add('borderSolid')
        }
        let arrowContainer = document.querySelectorAll(".arrowContainer");
        for (let i = 0; i < arrowContainer.length; i++) {
            arrowContainer[i].classList.add('invisible')
        }
        let filterPageUnit = document.querySelectorAll(".filterPageUnit");
        for (let i = 0; i < filterPageUnit.length; i++) {
            filterPageUnit[i].classList.add('invisible')
            filterPageUnit[i].classList.add('blackColorText')
        }
        let activeFilterPageUnit = document.querySelectorAll(".activeFilterPageUnit");
        for (let i = 0; i < activeFilterPageUnit.length; i++) {
            activeFilterPageUnit[i].classList.add('blackColorText')
            activeFilterPageUnit[i].classList.add('grey')
        }

        document.querySelector('.postProductMain').classList.add('blackColor')
        document.querySelector('.confirmBox-container main').classList.add('blackColor')

        let buycardh1 = document.querySelectorAll(".buycardh1");
        for (let i = 0; i < buycardh1.length; i++) {
            buycardh1[i].classList.add('blackColorText')
        }
        let price = document.querySelectorAll(".price");
        for (let i = 0; i < price.length; i++) {
            price[i].classList.add('blackColorText')
        }
        let featurep = document.querySelectorAll(".feature p");
        for (let i = 0; i < featurep.length; i++) {
            featurep[i].classList.add('blackColorText')
        }
        let product_unit = document.querySelectorAll(".product-unit");
        for (let i = 0; i < product_unit.length; i++) {
            product_unit[i].classList.add('fullBlack')
        }
        let product_name = document.querySelectorAll(".product-name");
        for (let i = 0; i < product_name.length; i++) {
            product_name[i].classList.add('blackColorText')
        }
    }
}

document.onkeyup = function (data) {
    if (data.which == 27) { // ESC
        visiblePage = ''
        $.post("http://ecommerce/close");
    }
};

if (!String.prototype.format) {
    String.prototype.format = function () {
        var args = arguments;
        return this.replace(/{(\d+)}/g, function (match, number) {
            return typeof args[number] != 'undefined' ?
                args[number] :
                match;
        });
    };
}