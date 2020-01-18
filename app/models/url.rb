class Url < ApplicationRecord

  belongs_to :user
  validates :long_url, { presence: true }
  validates :short_url, { presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9]+\z/ }, length: {maximum: 15}, exclusion: { in: %w(mypage privacy settings index home top help about security contact support faq form mail update mobile tour plan price business company store shop term rule inquiry legal policy image css stylesheet src js javascript asset account user users posts item entry article event doc word product download video community blog site popular i my me topic news info status search explore share feature upload rss widget api wiki auth session register login logout signup signin signout root postmaster webmaster show create edit update destroy new dashboard recruit join offer career corp school dev test bug code guest web root info admin guest delete remove www null 0 default empty page app archive bookmark captcha comment jump maintenance profile premium ranking setting source tool tag api rpc id reset post member connect self notify read recent recently bot game special forum category report secure contribute howto usage feed contest ad service system sys official message msg project new old first last photo config log analysis design theme lang language tutorial repository purpose query start get spec call phone manual owner license calendar organization develop developer asct book friend portal share group dic dict dictionary pr press release version error diary state graph watch infomation navi navigation site sitemap cart gift alpha beta tux year wiki private analytics public static img style script file flash swf dist xml svg cgi atom forgot server cgi-bin server-status balancer-manager icon ldap-status server-info svn rails) }}
  validates :user_id, { presence: true }
  validates :click_count, { presence: true }

end
