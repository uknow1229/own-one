module ApplicationHelper
  def default_meta_tags
    {
      site: 'OWN ONE',
      title: 'OWN ONE',
      reverse: true,
      charset: 'utf-8',
      description: 'フィットネス・食事・体重記録＆共有サービス',
      keywords: 'トレーニー,食事記録,運動記録',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url("favicon.ico"), sizes: "60x60" },
        { href: image_url("logo5.png"), rel: "apple-touch-icon", sizes: "90x90", type: "image/png" },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('logo5.png'), 
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('logo5.png')
      }
    }
  end
end
