$(function() {

  var search_list = $(".listview.js-lazy-load-images");

  function appendUser(user) {
    var html = `<li>
                  <a class="listview__element--right-icon" href="/products/${ user.id }/reviews/new" name="${ user.name }">
                    <div class="row no-space-bottom">
                      <div class="col2">
                        <div class="thumbnail thumbnail--movies">
                          <div class="thumbnail__figure" style="background-image: url(${ user.image });" name="${ user.name }"></div>
                        </div>
                      </div>
                      <div class="col6 push6">
                        <h3 class="text-middle text-break">
                          <span class="color-sub">${ user.team_name }</span>
                        </h3>
                        <p class="text-xsmall text-overflow">
                          ${ user.body }
                        </p>
                      </div>
                    </div>
                  </a>
                </li>`
    search_list.append(html);
  }

  function appendNoUser(user) {
    var html = `<li>
                  <div class='listview__element--right-icon'>${ user }</div>
                </li>`
    search_list.append(html);
  }

  $(".search__query").on("keyup", function() {
    var input =  $(".search__query").val();

    $.ajax({
      type: 'GET',
      url: '/categories/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $(".listview.js-lazy-load-images").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          appendUser(user);
        });
      }
      else {
        appendNoUser("一致するはあユーザーはいません");
      }
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });
});
