module ApplicationHelper
  def default_meta_tags
    {
      site: 'MyEmotion',
      title: 'MyEmotion',
      reverse: true,
      charset: 'utf-8',
      description: '通常は紙とペンを用いて行う筆記開示をWeb上で行うサービスです',
      keywords: '筆記開示, Expressive Writing, ストレス軽減, リラックス, スッキリ',
      canonical: request.original_url,
      separator: '|',
      icon: image_url('favicon.ico'),
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('apple-touch-icon.png'), rel: 'apple-touch-icon' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: [
          '@__rina06',
        ]
      }
    }
  end
end
