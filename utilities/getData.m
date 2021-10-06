function res = getData( field, time )

    fieldsizes = size(field);
    res = field(time, 1:fieldsizes(2)-1);

end

