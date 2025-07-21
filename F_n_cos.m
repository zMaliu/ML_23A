function n_cos = F_n_cos(a_s,y_s,m_site,t_site)
    [n,~,~]=F_mirror(a_s,y_s,m_site,t_site);
    [n_inline,~]=F_IOline(m_site,a_s,y_s,n);
    n_cos = dot(n_inline,n);
end