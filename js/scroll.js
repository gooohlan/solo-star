/*
 * Solo - A small and beautiful blogging system written in Java.
 * Copyright (c) 2010-present, b3log.org
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
(function () {

    /**
     * @description 监听滚动高度，是否显示返回顶部
     */
    function myCustomFn(el) {
        if (el.mcs.top < -600) {
            if ($('#return-top').css('opacity') === '0') {
                $('#return-top').velocity('stop').velocity({opacity: 1}, {
                    duration: 500,
                    display: 'block'
                });
            }
        } else {
            $('#return-top').velocity('stop').velocity({opacity: 0}, {
                duration: 500,
                display: 'none'
            });
        }
    }

    /**
     * @description 阅读进度
     * @param el
     */
    function readPercent(el) {
        // console.log(el.mcs.content[0].offsetHeight);
        let percent = Math.round(-el.mcs.top / (el.mcs.content[0].offsetHeight - el.offsetHeight) * 100);
        $('.sidebar-toc-progress .progress-num').text(percent);
        $('.sidebar-toc-progress-bar').velocity('stop').velocity({width: percent + '%'}, {
            duration: 100,
            easing: 'easeInOutQuart'
        });
    }

    /**
     * @description 滚动到页面顶部
     */
    $('#return-top').on('click', function () {
        $('#content-outer').mCustomScrollbar('scrollTo', 'top', {
            scrollInertia: 1000,
            scrollEasing: 'easeInOut'
        });
    });

    /**
     * @description 滚动条修饰 - jquery 插件
     */
    $('#content-outer').mCustomScrollbar({
        theme: 'minimal',
        axis: 'y', // horizontal scrollbar
        callbacks: {
            whileScrolling: function () {
                myCustomFn(this);
                readPercent(this);
                findHeadPosition(this);
            },
            onScroll: function () {

            }
        }
    });
    $('#sidebar-toc-content').mCustomScrollbar({
        theme: 'minimal',
        axis: 'y', // horizontal scrollbar
        callbacks: {}
    });

    // $('figure.highlight').mCustomScrollbar({
    //     theme: 'minimal',
    //     axis: 'x', // horizontal scrollbar
    //     mouseWheel: {
    //         enable: false
    //     },
    //     callbacks: {}
    // });

    /**
     * @description menu link scroll to content
     */
    $('.sidebar .article__toc').find("li").find("a").on('click', function (e) {
        e.preventDefault();
        let _id = $(this).attr('href');
        $('#content-outer').mCustomScrollbar('scrollTo', _id, {
            scrollInertia: 500
        });
    });

    /**
     * @description 找到当前页面的位置，更改 active 目录
     * @param el
     */
    function findHeadPosition(el) {
        let currentId = '';
        const menuHeight = $('header').height() + 1;
        let list = $('#post').find('h1,h2,h3,h4,h5,h6');
        list.each(function () {
            if ($(this).offset().top <= menuHeight) {
                currentId = $(this).attr('id');
            }else{
            }
        });
        $('.sidebar .article__toc').find("li").find("a").removeClass('active');
        if (currentId === '') {
            return;
        }
        let $this = $('a[href="#' + currentId + '"]');
        console.log($this.html())
        $this.addClass('active');
    }

    /**
     * @description expand toc-item
     * @param $item
     */
    function expandToc($item) {
        // $item.show();
        $item.velocity('stop').velocity('fadeIn', {
            duration: 500,
            easing: 'easeInQuart'
        });
    }
}());