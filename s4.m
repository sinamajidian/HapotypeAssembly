close all
clearvars
clc

a1=readtable('c.txt','Delimiter','\t','HeaderLines',0);
a=table2cell(a1);
N=2273;%;7; %number of reads or rows
l=12296;%0; %22801; %22801 number of column or length of haplotype
%122960
%100406
R=zeros(N,l)+100;

for i=1:N %length(a)
    row=zeros(1,l)+NaN;
    string = a{i}; %1 chr22_SPH2_1940 3 100 C==
    %2 chr22_SPC7_9526 3 1 6 01 =:=
    ii=1;
    String_BlockNumber=[]; %for two digits BlockNumber
    while isspace(string(ii))~=1
        String_BlockNumber=[String_BlockNumber,string(ii)];
        ii=ii+1;
    end
    BlockNumber=str2num(String_BlockNumber);
    StartingPoint=zeros(1,BlockNumber);
    ii=ii+1;
    while isspace(string(ii))~=1 % for going affter 'Chr2_...'
        ii=ii+1;
    end
    
    for j=1:BlockNumber
        
        ii=ii+1;
        String_StartingPoint=[]; %for two digits starting point
        while isspace(string(ii))~=1
            String_StartingPoint=[String_StartingPoint,string(ii)];
            ii=ii+1;
        end
        StartingPoint(j)=str2num(String_StartingPoint);
        site=StartingPoint(j);
        ii=ii+1;
        
        while isspace(string(ii))~=1  %
            row(site)=str2num(string(ii));   % put the reads  in 'row'  for each block
            site=site+1;
            ii=ii+1;
        end
        
    end
    
    
    
    R(i,:)=row;
    
    
end


Rtemp=R;
%R(1,:)=[];

R1=zeros(size(R));

for i=1:size(R,1)
    for j=1:size(R,2)
        if R(i,j)==1  R1(i,j)=1; end
        if R(i,j)==0  R1(i,j)=-1; end
        
    end
end




