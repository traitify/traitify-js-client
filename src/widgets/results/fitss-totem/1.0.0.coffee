window.Traitify.ui.resultsFitssTotem = (assessmentId, selector, options, callBack)->
  Builder = Object()

  if selector.indexOf("#") != -1
    selector = selector.replace("#", "")
    Builder.main = document.getElementById(selector)
  else
    selector = selector.replace(".", "")
    Builder.main = document.getElementsByClassName(selector)[0]


  Builder.partials = Object()
  Builder.partials.make = (elementType)->
    document.createElement(elementType)

  Builder.partials.div = (attributes)->
    div = @make("div")
    for attributeName of attributes
      div.setAttribute(attributeName, attributes[attributeName])

    div

  Builder.partials.img = (attributes)->
    img = @make("img")
    for attributeName of attributes
      img.setAttribute(attributeName, attributes[attributeName])

    img


  Builder.partials.personalityType = (data)->
    container = @div({class: "personality-type"})
    @style.personalityType(container, data)

    badgeContainer = @div({class:"badge-container"})
    @style.badgeContainer(badgeContainer, data)
    container.appendChild(badgeContainer)

    badgeImage = @img({class: "badge-image", src: data.badgeSrc})
    @style.badgeImage(badgeImage, data)
    badgeContainer.appendChild(badgeImage)

    informationContainer = @div({class: "information-container"})
    @style.informationContainer(informationContainer, data)
    container.appendChild(informationContainer)

    name = @div({class:"name"})
    name.innerHTML = data.name
    @style.name(name, data)
    informationContainer.appendChild(name)
    
    score = @div({class:"score"})
    @style.score(score, data)
    localScore = if data.score >= 0 then Math.round(data.score) else "(#{Math.round(Math.abs(data.score))})"
    score.innerHTML = localScore
    informationContainer.appendChild(score)

    barContainer = @div({class:"row bar-container"})
    @style.barContainer(barContainer, data)
    informationContainer.appendChild(barContainer)

    bar = @div({class:"bar"})
    @style.bar(bar, data)
    barContainer.appendChild(bar)

    barInner = @div({class:"bar-inner"})
    @style.barInner(barInner, data)
    bar.appendChild(barInner)

    
    container

  Builder.partials.style = Object()
  Builder.partials.style.personalityTypesContainer = (node, personalityType)->
    node.style.width = "25.3em"
    node.style.boxSizing = "initial"

  Builder.partials.style.personalityType = (node, personalityType)->
    node.style.backgroundColor = "##{personalityType.colorOne}"
    node.style.display = "inline-block"
    node.style.marginLeft = "0px"
    node.style.width = "25.3em"
    node.style.height = "5em"
    node.style.verticalAlign = "top" 
    node.style.fontFamily = 'Helvetica Neue'
    node.style.fontWeight = 100
    node.style.boxSizing = "initial"

  Builder.partials.style.badgeContainer = (node, personalityType)->
    node.style.backgroundColor = "##{personalityType.colorTwo}"
    node.style.width = "5em" 
    node.style.height = "5em" 
    node.style.display = "inline-block"
    node.style.verticalAlign = "top" 
    node.style.textAlign = "center"
    node.style.paddingLeft = ".1em"
    node.style.boxSizing = "initial"

  Builder.partials.style.badgeImage = (node, personalityType)->
    node.style.width = "3.5em" 
    node.style.height = "3.5em" 
    node.style.marginTop = ".8em"
    node.style.boxSizing = "initial"

  Builder.partials.style.barContainer = (node, personalityType)->
    node.style.width = "18.5em" 
    node.style.height = "1em"
    node.style.margin = "1em 1em 0em .5em"
    node.style.boxSizing = "initial"

  Builder.partials.style.bar = (node, personalityType)->
    node.style.height = "1em"
    node.style.boxSizing = "initial"

  Builder.partials.style.barInner = (node, personalityType)->
    node.style.height = "1em"
    node.style.width = "#{Math.abs(personalityType.score)}%"
    node.style.backgroundColor = "##{personalityType.colorThree}"
    if personalityType.score <= 0
      node.style.float = "right"
    node.style.boxSizing = "initial"

  Builder.partials.style.name = (node, personalityType)->
    node.style.display = "inline-block" 
    node.style.marginTop = "7px" 
    node.style.marginLeft = "10px" 
    node.style.color = "#fff" 
    node.style.letterSpacing = "2px"
    node.style.fontSize = "1.4em" 
    node.style.textTransform = "uppercase"
    node.style.boxSizing = "initial"

  Builder.partials.style.score = (node, personalityType)->
    node.style.display = "inline-block"
    node.style.marginTop = "7px" 
    node.style.marginRight = "15px"
    node.style.color = "#fff" 
    node.style.fontSize = "1.4em" 
    node.style.float = "right" 
    node.style.letterSpacing = "1.5px"
    node.style.boxSizing = "initial"

  Builder.partials.style.informationContainer = (node, personalityType)->
    node.style.display = "inline-block" 
    node.style.width = "20em"
    node.style.textAlign = "left"
    node.style.boxSizing = "initial"

  #####################################################
  # Initialize
  #####################################################
  Traitify.getPersonalityTypes(assessmentId, (data)->
    personalityTypesContainer = Builder.partials.div({class: "personality-type-container"})
    Builder.partials.style.personalityTypesContainer(personalityTypesContainer)

    for personalityType in data.personality_types
      localData = Object()
      localData.badgeSrc = personalityType.personality_type.badge.image_small
      localData.name = personalityType.personality_type.name
      localData.score = personalityType.score
      localData.colorOne = personalityType.personality_type.badge.color_1
      localData.colorTwo = personalityType.personality_type.badge.color_2
      localData.colorThree = personalityType.personality_type.badge.color_3

      personalityTypesContainer.appendChild(Builder.partials.personalityType(localData))

    Builder.main.innerHTML = String()
    Builder.main.appendChild(personalityTypesContainer)
  )



  phone = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
  widgetParent = Builder.main.parentNode
  
  containerWidth = widgetParent.offsetWidth
  if containerWidth > 10
    widgetParentCopy = widgetParent.cloneNode(true)
    widgetParentCopy.style.visibility = "hidden"
    widgetParentCopy.style.display = "block"
    document.getElementsByTagName("body")[0].appendChild(widgetParentCopy)

    containerWidth = widgetParent.offsetWidth

  stretchSize = if phone then 15 else 27
  if containerWidth < 568
    Builder.main.style.fontSize =  containerWidth / stretchSize + "px"
  else
    Builder.main.style.fontSize = "16px"

  oldOnResize = window.onresize
  window.onresize = (event)->
    if widgetParent.offsetWidth >= 568 && !phone
      Builder.main.style.fontSize =  "16px"
    else
      Builder.main.style.fontSize =  widgetParent.offsetWidth / stretchSize + "px"

  supportsOrientationChange = "onorientationchange" of window
  orientationEvent = (if supportsOrientationChange then "orientationchange" else "resize")
  window.addEventListener orientationEvent, (->
    if phone
      oldOnResize.call window, event  if oldOnResize
      newWidth = Builder.main.offsetWidth / 15
      Builder.main.style.fontSize = newWidth + "px"
    
  ), false


  # Trigger CallBack
  if callBack?
    callBack(Builder);

  Builder