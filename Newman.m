function [dQ tree D  ] = Newman( A ,Kernighan_Lin_optimisation,significance)
%NEWMAN Summary of this function goes here
%   Detailed explanation goes here


classT=class(A);
if(nargin==1)
    Kernighan_Lin_optimisation=true;
end

n=size(A,1); % total number of vertices
m=summ(A)/2; % total number of edges
k=sum(A); % number of edges conected with vertex

D=ones(1,n); % maps vertices to groups


B=[]; %Modularity Matrix
tree=0;
ng=1; % number of temporary groups - is not equal the numbor of groups in the end
unchecked_groups=1; % List of groups which havnt been checked for dividability yet


while ~isempty(unchecked_groups)
    g=unchecked_groups(1);fprintf('trying to split group %d...',g);
    group=cast(find(D==g),classT);
    
    if(ng==1)
        B=A-k.'*k/(2*m);
        Bg=B;
    else
        Bg=B(group,group)-diag(sum(B(group,group),2));
    end
    [u,betas]=eig(Bg);%eigenvalues/vectors
    beta=sum(betas);% as betas is a diagonal matrix
    u_=u.';
    beta_=beta.';

    %s=(randn(length(beta),1)>0.5)*2-1;%for testin porpuses
    s=((u(:,end)>0)*2-1);
    dQ(g)=single(1/(4*m)*   sum(((u.'*s).^2).'.*beta));
    %optimize
    modularity_increased=Kernighan_Lin_optimisation;
    while modularity_increased
        s_unchanged=true(size(s));
        if(isa(classT,'garray'))
            s_unchanged=glogical(s_unchanged);
        end
        st=s;
        dQtt=nan(size(s));
        stt=cell(size(s));
        %changer=(1-2*eye(length(s),length(s),classT));
        for n_changes=1:length(s)
           
            the_unchanged=cast(find(s_unchanged),classT);
            n_unchanged=length(the_unchanged);
            %sttts= bsxfun(@times,st, changer);
            %usttts=sttts(:,the_unchanged);
            %dQttt=1/(4*m)*sum(bsxfun(@times,permute(ndfun('mult',double(u.'),double(permute(usttts,[1,3,2]))),[3,1,2]).^2,beta),2);
             dQttt=nan(1,n_unchanged,classT);
             for ii=1:n_unchanged % gfor for
                 si=the_unchanged(ii);
                 sttt=st; % local(ii,st); st;
                 sttt(si)=-sttt(si);
                 dQttt(ii)= sttt.'*Bg*sttt;%sum(((u.'*sttt).^2).'.*beta);
             end % gend end
             dQttt=dQttt./(4*m);
            [dQt,i]=max(dQttt);
            si_changed=the_unchanged(i);
            st(si_changed)=-st(si_changed);
            s_unchanged(si_changed)=false;
            stt{n_changes}=st;dQtt(n_changes)=dQt;
        end
        [dQt n_changes]=max(dQtt);
        st=stt{n_changes};
        

        if dQt>dQ(g)
            fprintf(' ...fine tuning (%+f)...',dQt-dQ(g));
            dQ(g)=dQt;
            s=st;
        else
            modularity_increased=false;
        end
    end

    %dQ=1/(4*m)*s.'*Bg*s%for testing pourpouses
    
    
    
    
    if(dQ(g)>0&&~(all(s+1)||all(s-1)))
        kg=sum(k(group(s>0)));
        kng=sum(k(group(s<0)));
        gm=kg+kng;
        pg=(kg*kng/4/gm^2*2);
        if(dQ(g)*(2*m)/(2*gm*pg*(1-pg))<significance)
            dQ(g)=0;
            fprintf(' not sificant \n',g);
        else
            D(group(s>0))=ng+1;
            D(group(s<0))=ng+2;
            tree=[tree g g];
            unchecked_groups=[unchecked_groups ng+1 ng+2];
            fprintf(' split into group %d and %d wich incresed modularity by %f \n',ng +1,ng+2,(dQ(g)));
            ng=ng+2;
        end
    else
        dQ(g)=0;
        fprintf(' failed \n',g);
    end    
    unchecked_groups=unchecked_groups(2:end);
end

end

